import 'package:get/get.dart';
import '../models/form_model.dart';

class FormListController extends GetxController {
  // FormListModel would be simply a list of forms, lets simplify for now.
  var forms = <FormModel>[].obs;

  void addForm(FormModel form) {
    forms.add(form);
  }

  void deleteForm(String id) {
    forms.removeWhere((form) => form.id == id);
  }

  void reorder(int originIndex, int destinationIndex) {
    if (originIndex < destinationIndex) {
      destinationIndex -= 1;
    }
    final FormModel form = forms.removeAt(originIndex);

    forms.insert(destinationIndex, form);

    //TODO: We could persist on backend
  }
}
