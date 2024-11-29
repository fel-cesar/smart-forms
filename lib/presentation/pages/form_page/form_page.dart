import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_forms/models/form_field.dart';
import 'package:smart_forms/presentation/components/components.dart';
import 'package:smart_forms/presentation/pages/form_page/form_field_list.dart';
import 'package:smart_forms/presentation/pages/form_page/form_page_action_button.dart';

import '../form_list_page/form_list_page_controller.dart';
import '../form_preview_page/form_preview_page.dart';
import 'form_page_controller.dart';
import '../add_field/add_field_page.dart';

class FormPage extends StatelessWidget {
  FormPage({super.key});

  final formController =
      Get.put(FormPageController(title: (Get.arguments as RxString).value));
  @override
  Widget build(context) {
    return Scaffold(
      floatingActionButton: FormPageActionButton(
        onSave: () {
          final formListController = Get.find<FormListPageController>();
          formListController.addForm(formController.form);
          Get.back();
        },
        onAddField: () async {
          final formField = await Get.bottomSheet<MarkFormField?>(
            Column(
              children: [
                NotchArea(rootContext: context),
                const Expanded(
                  child: AddFieldPage(),
                ),
              ],
            ),
            isScrollControlled: true,
          );

          if (formField != null) {
            formController.fields.add(formField);
          }
        },
        onPreview: () {
          Get.to(FormPreviewPage(), transition: Transition.noTransition);
        },
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(14, 0, 14, 14),
              child: TextXL3.bold(formController.form.title),
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(28),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(14),
                  child: FormFieldList(
                    fields: formController.fields,
                    onReorder: formController
                        .reorder, // Pass the controller's reorder logic
                    onEditField: (index) async {
                      final updatedField =
                          await Get.bottomSheet<MarkFormField?>(
                        Column(
                          children: [
                            NotchArea(rootContext: context),
                            const Expanded(child: AddFieldPage()),
                          ],
                        ),
                        isScrollControlled: true,
                        settings: RouteSettings(
                          arguments: formController.fields[index],
                        ),
                      );
                      if (updatedField != null) {
                        formController.updateField(index, updatedField);
                      }
                    },
                    onDeleteField: (fieldId) {
                      formController.removeField(fieldId);
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
