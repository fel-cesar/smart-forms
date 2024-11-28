import 'package:get/get.dart';
import 'package:smart_forms/models/form_field.dart';
import 'package:smart_forms/models/form_fields/text_form_field_model.dart';

class AddFieldPageController extends GetxController {
  final type = 'text'.obs;
  final name = ''.obs;
  final iconName = ''.obs;

  FormField get formField {
    switch (type.value) {
      case 'text':
        return TextFormFieldModel(
          id: DateTime.now().toString(),
          label: name.value,
          type: type.value,
        );
      default:
        // Default to text, this code should not be reached
        return TextFormFieldModel(
            id: DateTime.now().toString(), label: name.value, type: type.value);
    }
  }
}
