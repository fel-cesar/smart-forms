import 'package:get/get.dart';
import 'package:smart_forms/models/form_model.dart';

import '../../../models/form_field.dart';

// TODO: Should we connect the controllers to models or pages? (pages IMO)
// TODO: Reorderable mixin?
class FormPageController extends GetxController {
  final fields = <FormField>[].obs;

  final String title;
  late FormModel
      form; // TODO: maybe not necessary according o SOLID, remove later

  FormPageController({required this.title}) {
    form = FormModel(
        id: DateTime.now().toString(),
        title: title.isEmpty ? 'New form ${DateTime.now().toLocal()}' : title,
        fields: fields);
  }

  void addField(FormField field) {
    fields.add(field);
  }

  void removeField(String id) {
    fields.removeWhere((field) => field.id == id);
  }

  void reorder(int originIndex, int destinationIndex) {
    if (originIndex < destinationIndex) {
      destinationIndex -= 1;
    }
    final FormField form = fields.removeAt(originIndex);
    fields.insert(destinationIndex, form);
  }
}
