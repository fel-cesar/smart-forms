import '../form_field.dart';

class TextFormFieldModel extends FormField {
  TextFormFieldModel(
      {required super.id,
      required super.label,
      required super.type, // TODO: do we need this? Should it be an enum? should be const? or should we just compare types of the class?
      String? super.value});
}
