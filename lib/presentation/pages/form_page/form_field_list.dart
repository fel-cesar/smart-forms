import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_forms/models/form_field.dart';
import 'package:smart_forms/presentation/components/dashed_input_list_item.dart';
import 'package:smart_forms/presentation/components/notch_area.dart';
import 'package:smart_forms/presentation/pages/add_field/add_field_page.dart';
import 'package:smart_forms/presentation/pages/form_page/form_field_list_item.dart';

class FormFieldList extends StatelessWidget {
  final RxList<MarkFormField> fields;
  final void Function(int oldIndex, int newIndex) onReorder;
  final ValueChanged<int> onEditField;
  final ValueChanged<String> onDeleteField;

  const FormFieldList({
    super.key,
    required this.fields,
    required this.onReorder,
    required this.onEditField,
    required this.onDeleteField,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return ReorderableListView.builder(
        footer: DashedInputListItem(
          onTap: () async {
            final newFormField = await Get.bottomSheet<MarkFormField?>(
              Column(
                children: [
                  NotchArea(rootContext: context),
                  const Expanded(child: AddFieldPage()),
                ],
              ),
              isScrollControlled: true,
            );
            if (newFormField != null) {
              fields.add(newFormField);
            }
          },
        ),
        onReorder: (oldIndex, newIndex) =>
            onReorder(oldIndex, newIndex), // Delegate to parent
        itemCount: fields.length,
        itemBuilder: (context, index) {
          final field = fields[index];
          return FormFieldListItem(
            key: ValueKey(field.id),
            field: field,
            onEdit: () => onEditField(index),
            onDelete: () => onDeleteField(field.id),
            index: index,
          );
        },
      );
    });
  }
}
