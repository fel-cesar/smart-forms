// models/dropdown_form_field.dart
import '../form_field.dart';
// TODO: WIP
class MarkCheckboxGroupFormFieldModel extends MarkFormField {
  final List<String> options;
  // String selectedValue;

  MarkCheckboxGroupFormFieldModel({
    required super.id,
    required super.label,
    required this.options,
    // required this.selectedValue,
    required super.type,
  });
}

