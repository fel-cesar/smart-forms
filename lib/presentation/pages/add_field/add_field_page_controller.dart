import 'package:get/get.dart';
import 'package:smart_forms/models/form_field.dart';
import 'package:smart_forms/models/form_fields/dropdown_form_field_model.dart';
import 'package:smart_forms/models/form_fields/form_text_field_model.dart';

class AddFieldPageController extends GetxController {
  final type = 'text'.obs;
  final name = ''.obs;
  final iconName = ''.obs;

  // TODO: these will be dynamic, these values are just placeholders
  final options = <String>['das', 'daskjhdalksj', 'dsakjdba'].obs;

  MarkFormField get formField {
    switch (type.value) {
      case 'text':
        return FormTextFieldModel(
          id: DateTime.now().toString(),
          label: name.value,
          type: type.value,
        );

      case 'dropdown':
        return MarkDropdownFormField(
          id: DateTime.now().toString(),
          label: name.value,
          type: type.value,
          options: options,
          selectedValue: options[0],
        );

      default:
        // Default to text, this code should not be reached
        return FormTextFieldModel(
            id: DateTime.now().toString(), label: name.value, type: type.value);
    }
  }
}
