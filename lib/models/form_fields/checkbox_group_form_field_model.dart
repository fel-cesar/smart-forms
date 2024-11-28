import 'package:smart_forms/constants.dart';

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
}
