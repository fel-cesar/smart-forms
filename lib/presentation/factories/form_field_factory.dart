import 'package:smart_forms/models/form_field.dart';
import 'package:smart_forms/models/form_fields/checkbox_group_form_field_model.dart';
import 'package:smart_forms/models/form_fields/dropdown_form_field_model.dart';
import 'package:smart_forms/models/form_fields/form_text_field_model.dart';

class FormFieldFactory {
  static MarkFormField create(Map<String, dynamic> data) {
    final String type = data['type'];

    switch (type) {
      case 'text':
        return FormTextFieldModel.fromMap(data);
      case 'dropdown':
        return MarkDropdownFormFieldModel.fromMap(data);
      case 'checkbox':
        return MarkCheckboxGroupFormFieldModel.fromMap(data);
      default:
        return FormTextFieldModel.fromMap(data);
    }
  }
}
