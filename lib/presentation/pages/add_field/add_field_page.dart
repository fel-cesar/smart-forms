import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_forms/presentation/components/components.dart';
import 'package:smart_forms/constants.dart';

import '../form_page/form_page_controller.dart';
import 'add_field_page_controller.dart';
import 'field_type_selector.dart';

class AddFieldPage extends StatelessWidget {
  AddFieldPage({super.key});

  final formController = Get.find<FormPageController>();
  final addFieldPageController = AddFieldPageController();

  @override
  Widget build(BuildContext context) {
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
        top: Radius.circular(17.5),
      ),
      child: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(14),
              child: Row(
                children: [
                  const Text(
                    Constants.addField,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: const Text(
                      Constants.cancel,
                      style: TextStyle(
                        color: Constants.blueHighlight,
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Button.small(
                    onPressed: () {
                      formController.fields.add(addFieldPageController
                          .formField); // TODO: remove hardcoded values
                      Get.back();
                    },
                    text: Constants.done,
                  )
                ],
              ),
            ),
            const Divider(
              height: 1,
              color: Constants.gray300,
            ),
            Expanded(
              child: SingleChildScrollView(
                padding:
                    const EdgeInsets.symmetric(horizontal: 48, vertical: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Icon'),
                    const SizedBox(height: 4),
                    Container(
                      color: Constants.gray200,
                      padding: const EdgeInsets.all(5),
                      child: Wrap(
                        spacing: 5,
                        runSpacing: 5,
                        children: [
                          ...List.generate(
                            35,
                            (index) => const SelectableIcon(
                              icon: Icons.biotech,
                              onPressed: null,
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text('Field Name'),
                    const SizedBox(height: 4),
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
                      onChanged: (value) =>
                          addFieldPageController.name.value = value,
                    ),
                    const SizedBox(height: 20),
                    const Text('Field Type'),
                    const SizedBox(height: 4),
                    Obx(
                      () => TextField(
                        // TODO: get text from type
                        controller: TextEditingController(
                            text: addFieldPageController.type.value),
                        readOnly: true,
                        onTap: () async {
                          await Get.bottomSheet(FieldTypeSelector<String>(
                            onSelect: (value) =>
                                addFieldPageController.type.value = value,
                            //TODO: this will be field type here.
                          ));
                        },

                        style: const TextStyle(fontSize: 12.25),
                        cursorColor: Constants.gray500,
                        decoration: const InputDecoration(
                          suffixIcon: Icon(Icons.arrow_drop_down_rounded),
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
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
