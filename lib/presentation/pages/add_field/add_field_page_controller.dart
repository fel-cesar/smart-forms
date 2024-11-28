import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_forms/models/form_field.dart';
import 'package:smart_forms/models/form_fields/checkbox_group_form_field_model.dart';
import 'package:smart_forms/models/form_fields/dropdown_form_field_model.dart';
import 'package:smart_forms/models/form_fields/form_text_field_model.dart';

class AddFieldPageController extends GetxController {
  final type = 'text'.obs;
  final name = ''.obs;
  final iconName = ''.obs;

  // TODO: For dropdown + checkbox options (TODO: apply SOLID)
  final options = <String>[].obs;
  final optionsKeys = <String>[].obs;
  final textFieldType = 'single'.obs;

  final arguments = Get.arguments;


  final textFieldController = TextEditingController();

  @override
  void onReady() {
    super.onReady();

    final currentFormField = arguments as MarkFormField?;
    if (currentFormField != null) {

      type.value = currentFormField.type;
      name.value = currentFormField.label;

      textFieldController.text = currentFormField.label;
      // TODO: Apply SOLID for specific initers
      if (currentFormField is MarkDropdownFormFieldModel) {
        options.value = (currentFormField).options;
        optionsKeys.value = (currentFormField)
            .options
            .map((e) => DateTime.now().toString())
            .toList();
      }

      if (currentFormField is MarkCheckboxGroupFormFieldModel) {
        options.value = (currentFormField).options;
        optionsKeys.value = (currentFormField)
            .options
            .map((e) => DateTime.now().toString())
            .toList();
      }
      if (currentFormField is FormTextFieldModel) {
        textFieldType.value = currentFormField.multiline ? 'multiline' : 'single';
      }
      refresh();
    }
  }

  MarkFormField get formField {
    switch (type.value) {
      case 'text':
        return FormTextFieldModel(
          id: DateTime.now().toString(),
          label: name.value,
          type: type.value,
          multiline: textFieldType.value == 'multiline',
        );
      case 'dropdown':
        return MarkDropdownFormFieldModel(
            id: DateTime.now().toString(),
            label: name.value,
            type: type.value,
            options: options,
            selectedValue: options[0]);
      case 'checkbox':
        return MarkCheckboxGroupFormFieldModel(
          id: DateTime.now().toString(),
          label: name.value,
          type: type.value,
          options: options,
        );
      default:
        // Default to text, this code should not be reached
        return FormTextFieldModel(
            id: DateTime.now().toString(), label: name.value, type: type.value);
    }
  }

  void reorder(int originIndex, int destinationIndex) {
    if (originIndex < destinationIndex) {
      destinationIndex -= 1;
    }
    final String option = options.removeAt(originIndex);

    options.insert(destinationIndex, option);

    final String optionKey = optionsKeys.removeAt(originIndex);

    optionsKeys.insert(destinationIndex, optionKey);
  }
}
