import 'package:smart_forms/presentation/pages/add_field/add_field_page_controller.dart';

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
      super.iconPath});

  @override
  initControllerParameters(AddFieldPageController controller) {
    super.initControllerParameters(controller);
    controller.textFieldType.value = multiline ? 'multiline' : 'single';
  }

  factory FormTextFieldModel.fromMap(Map<String, dynamic> data) {
    return FormTextFieldModel(
      id: data['id'],
      label: data['name'],
      type: data['type'],
      multiline: data['multiline'],
      iconPath: (data['iconPath'] as String).isEmpty
          ? Constants.iconRename
          : data['iconPath'],
    );
  }
}
