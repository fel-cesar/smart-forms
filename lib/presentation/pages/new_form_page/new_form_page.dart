import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_forms/presentation/components/components.dart';
import 'package:smart_forms/constants.dart';
import 'package:smart_forms/presentation/pages/form_page/form_page.dart';

class NewFormPage extends StatelessWidget {
  NewFormPage({super.key});

  // We dont need controller for a single field
  final title = RxString('');

  @override
  Widget build(context) {
    const formBorderStyle = OutlineInputBorder(
      borderSide: BorderSide(
        color: Constants.gray400,
      ),
      borderRadius: BorderRadius.all(
        Radius.circular(17.5),
      ),
    );

    return ClipRRect(
      borderRadius: const BorderRadius.vertical(
        top: Radius.circular(35),
      ),
      child: Container(
        padding: const EdgeInsets.all(48),
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                const Text(
                  Constants.newForm,
                  style: TextStyle(
                    fontSize: 31.5,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                Button.small(
                  onPressed: Get.back,
                  text: Constants.cancel,
                )
              ],
            ),
            const Spacer(),
            Container(),
            TextField(
              style: const TextStyle(fontSize: 12.25),
              cursorColor: Constants.gray500,
              decoration: const InputDecoration(
                hintText: Constants.formTitle,
                hintStyle: TextStyle(
                  color: Constants.gray500,
                  fontSize: 12.25,
                  fontWeight: FontWeight.w400,
                ),
                border: formBorderStyle,
                enabledBorder: formBorderStyle,
                focusedBorder: formBorderStyle,
              ),
              onChanged: (value) {
                title.value = value;
              },
            ),
            const SizedBox(height: 42),
            Button.jumbo(
              onPressed: () {
                // dismiss bottom sheet
                if (Get.isBottomSheetOpen == true) {
                  Get.back();
                }

                // then navigate
                Get.to(() => FormPage(), arguments: title);
              },
              text: Constants.create,
            ),
          ],
        ),
      ),
    );
  }
}
