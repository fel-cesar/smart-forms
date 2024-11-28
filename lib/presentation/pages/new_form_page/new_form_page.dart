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
                const TextXL4.bold(Constants.newForm),
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
              decoration: InputDecoration(
                hintText: Constants.formTitle,
                hintStyle: textStyles[TextSize.sm]!.copyWith(color: Constants.gray500),
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
                Get.to(() =>  FormPage(), arguments: title);
              },
              text: Constants.create,
            ),
          ],
        ),
      ),
    );
  }
}
