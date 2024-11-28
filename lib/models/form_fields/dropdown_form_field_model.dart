// models/dropdown_form_field.dart
import '../form_field.dart';

class MarkDropdownFormField extends MarkFormField {
  final List<String> options;
  String selectedValue;

  MarkDropdownFormField({
    required super.id,
    required super.label,
    required this.options,
    required this.selectedValue,
    required super.type,
  });
}
