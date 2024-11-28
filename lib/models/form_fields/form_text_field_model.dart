import '../form_field.dart';

class FormTextFieldModel extends MarkFormField {

  final bool multiline;

  FormTextFieldModel(
      {required super.id,
      required super.label,
      required super.type,
      this.multiline = false,
       // TODO: do we need this? Should it be an enum? should be const? or should we just compare types of the class?
      String? super.value});
}
