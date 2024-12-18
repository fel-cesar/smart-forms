import 'package:get/get.dart';
import 'package:smart_forms/models/form_model.dart';

import '../../../models/form_field.dart';

class FormPageController extends GetxController {
  final fields = <MarkFormField>[].obs;

  final String title;
  late FormModel form;
  FormPageController({required this.title}) {
    form = FormModel(
        id: DateTime.now().toString(),
        title: title.isEmpty ? 'New form ${DateTime.now().toLocal()}' : title,
        fields: fields);
  }

  void addField(MarkFormField field) {
    fields.add(field);
  }

  void removeField(String id) {
    fields.removeWhere((field) => field.id == id);
  }

  void reorder(int originIndex, int destinationIndex) {
    if (originIndex < destinationIndex) {
      destinationIndex -= 1;
    }
    final MarkFormField form = fields.removeAt(originIndex);
    fields.insert(destinationIndex, form);
  }

  void updateField(int index, MarkFormField updatedField) {
    if (index >= 0 && index < fields.length) {
      fields[index] = updatedField;
    }
  }
}
