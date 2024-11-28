import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_forms/constants.dart';

import '../../factories/form_field_to_widget_factory.dart';
import '../form_page/form_page_controller.dart';

class FormPreviewPage extends StatelessWidget {
  FormPreviewPage({super.key});

  final formController = Get.find<FormPageController>();

  @override
  Widget build(context) {
    return Scaffold(
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton.filled(
            style: IconButton.styleFrom(
              backgroundColor: Constants.gray400,
              padding: const EdgeInsets.all(18),
            ),
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              color: Constants.gray800,
              Icons.visibility,
              size: 18,
            ),
          ),
          const SizedBox(width: 21),
        ],
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(14, 0, 14, 14),
              child: Text(
                formController.form.title,
                style: const TextStyle(
                  fontSize: 26.25,
                  fontWeight: FontWeight.bold,
                  color: Constants.gray800,
                ),
              ),
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
                  child: Obx(() {
                    return ListView.builder(
                      itemCount: formController.fields.length,
                      itemBuilder: (context, index) {
                        final formField = formController.fields[index];
                        // Proper list tile here
                        return FormFieldToWidgetFactory.buildFormField(
                            formField);
                      },
                    );
                  }),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
