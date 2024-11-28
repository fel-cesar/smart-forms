import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_forms/presentation/components/components.dart';
import 'package:smart_forms/constants.dart';
import 'package:smart_forms/presentation/pages/add_field/add_field_page.dart';
import 'package:smart_forms/controllers/form_page_controller.dart';
import 'package:smart_forms/presentation/pages/form_list_page/form_list_page_controller.dart';

class FormPage extends StatelessWidget {
  FormPage({super.key});

  final formController =
      Get.put(FormPageController(title: (Get.arguments as RxString).value));

  @override
  Widget build(context) {
    return Scaffold(
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton.filled(
            style: IconButton.styleFrom(
              backgroundColor: Constants.gray800,
              padding: const EdgeInsets.all(18),
            ),
            onPressed: () => Get.bottomSheet(AddFieldPage()),
            icon: const Icon(
              Icons.add,
              size: 18,
            ),
          ),
          const SizedBox(width: 21),
          IconButton.filled(
            style: IconButton.styleFrom(
              backgroundColor: Constants.gray800,
              padding: const EdgeInsets.all(18),
            ),
            onPressed: () {},
            icon: const Icon(
              Icons.visibility,
              size: 18,
            ),
          ),
          const SizedBox(width: 21),
          IconButton.filled(
            style: IconButton.styleFrom(
              backgroundColor: Constants.gray800,
              padding: const EdgeInsets.all(18),
            ),
            onPressed: () {
              final formListController = Get.find<FormListPageController>();
              formListController.addForm(formController.form);
              Get.back();
            },
            icon: const Icon(
              Icons.check,
              size: 18,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(14),
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
                    return ReorderableListView.builder(
                      footer: DashedInputListItem(
                        onTap: () => Get.bottomSheet(AddFieldPage()),
                      ),
                      onReorder: (oldIndex, newIndex) {
                        formController.reorder(oldIndex, newIndex);
                      },
                      itemCount: formController.fields.length,
                      itemBuilder: (context, index) {
                        final formField = formController.fields[index];
                        // Proper list tile here
                        return ListTile(
                          key: ValueKey(formField.id),

                          title: Text(formField.label),
                          trailing: IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () =>
                                formController.removeField(formField.id),
                          ),

                          // TODO: put DS icon here
                          leading: ReorderableDragStartListener(
                            index: index,
                            child: const Icon(Icons.drag_handle),
                          ),
                        );
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
