import 'package:flutter/material.dart';
import 'package:smart_forms/presentation/pages/add_field/add_field_page_controller.dart';

import '../../constants.dart';
import '../form_field.dart';

class MarkDropdownFormFieldModel extends MarkFormField {
  final List<String> options;
  @override
  String get defaultIconPath => Constants.iconDropdown;

  MarkDropdownFormFieldModel({
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

  factory MarkDropdownFormFieldModel.fromMap(Map<String, dynamic> data) {
    return MarkDropdownFormFieldModel(
      id: data['id'],
      type: data['type'],
      options: data['options'],
      iconPath: data['iconPath'],
      label: data['name'],
    );
  }
}
