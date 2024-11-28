import '../../constants.dart';
import '../form_field.dart';

class FormTextFieldModel extends MarkFormField {

  final bool multiline;

  @override
  String get defaultIconPath => Constants.iconRename;


  FormTextFieldModel(
      {required super.id,
      required super.label,
      required super.type,
      this.multiline = false,
      super.iconPath,
      String? super.value});
}
