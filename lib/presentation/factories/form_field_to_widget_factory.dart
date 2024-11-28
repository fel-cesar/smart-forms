import 'package:flutter/material.dart';
import 'package:smart_forms/models/form_fields/dropdown_form_field_model.dart';
import 'package:smart_forms/presentation/components/components.dart';
import 'package:smart_forms/presentation/components/dropdown.dart';

import '../../models/form_field.dart';
import '../../models/form_fields/form_text_field_model.dart';

class FormFieldToWidgetFactory {
  static Widget buildFormField(MarkFormField field) {
    if (field is FormTextFieldModel) {
      return const MarkTextField();
    }
    if (field is MarkDropdownFormField) {
      return MarkDropdown(label: field.label, options: field.options);
    }

    // Add more mappings for other field types here
    throw UnsupportedError('Unsupported form field type: ${field.runtimeType}');
  }
}
