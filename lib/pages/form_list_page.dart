import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants.dart';
import '../controllers/forms_list_controller.dart';
import '../models/form_model.dart';

class FormListPage extends StatelessWidget {
  FormListPage({super.key});

  final FormsListController formsController = Get.find<FormsListController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(Constants.formsList)),
      body: Column(
        children: [
          Expanded(
            child: Obx(() {
              return
              ReorderableListView.builder(
                onReorder: (oldIndex, newIndex) {
                  formsController.reorder(oldIndex, newIndex);
                },
                itemCount: formsController.forms.length,
                itemBuilder: (context, index) {
                  final form = formsController.forms[index];

                  return ListTile(

                    key: ValueKey(form.id),
                    title: Text(form.title),
                    subtitle: Text("Fields: ${form.fields.length}"),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () => formsController.deleteForm(form.id),
                    ),
                    leading: ReorderableDragStartListener(
                      index: index,
                      child: const Icon(Icons.drag_handle),
                    ),
                    onTap: () async {
                      // Pass the selected form to the builder screen
                      // await Get.to(() => BuilderScreen(), arguments: form,);
                    },
                  );
                },
              );
            }),
          ),
          ElevatedButton(
            onPressed: () {
              // Add a new form
              formsController.addForm(
                FormModel(id: DateTime.now().toString(), title: "New Form ${DateTime.now()}"),
              );
            },
            child: const Text("Add New Form"), // this will be removed
          ),
        ],
      ),
    );
  }
}
