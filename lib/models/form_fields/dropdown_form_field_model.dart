// models/dropdown_form_field.dart
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
    // required this.selectedValue,
    required super.type,
  });
}
