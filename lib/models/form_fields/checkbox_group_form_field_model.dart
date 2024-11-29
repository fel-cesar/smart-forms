import 'package:flutter/material.dart';
import 'package:smart_forms/constants.dart';
import 'package:smart_forms/presentation/pages/add_field/add_field_page_controller.dart';

import '../form_field.dart';

class MarkCheckboxGroupFormFieldModel extends MarkFormField {
  final List<String> options;
  @override
  String get defaultIconPath => Constants.iconCheckbox;

  MarkCheckboxGroupFormFieldModel({
    required super.id,
    required super.label,
    required this.options,
    super.iconPath,
    required super.type,
  });

  @override
  initControllerParameters(AddFieldPageController controller) {
    super.initControllerParameters(controller);

    controller.options.value = options;
    controller.optionsKeys.value =
        options.map((e) => DateTime.now().toString()).toList();
    controller.optionsTextFieldController.value =
        options.map((e) => TextEditingController(text: e)).toList();
  }

  factory MarkCheckboxGroupFormFieldModel.fromMap(Map<String, dynamic> data) {
    return MarkCheckboxGroupFormFieldModel(
      id: data['id'],
      label: data['name'],
      type: data['type'],
      options: data['options'],
      iconPath: (data['iconPath'] as String).isEmpty
          ? Constants.iconRename
          : data['iconPath'],
    );
  }
}
