import 'package:smart_forms/presentation/pages/add_field/add_field_page_controller.dart';

import '../constants.dart';

abstract class MarkFormField {
  final String id;
  final String label;
  final String type;
  final String iconPath;
  String get defaultIconPath => Constants.iconRename;

  MarkFormField({
    required this.id,
    required this.label,
    required this.type,
    this.iconPath = Constants.iconRename,
  });

  initControllerParameters(AddFieldPageController controller) {
    basicControllerParametersInit(controller);
  }

  basicControllerParametersInit(AddFieldPageController controller) {
    controller.type.value = type;
    controller.name.value = label;
    controller.iconPath.value = iconPath;
    controller.textFieldController.text = label;
  }
}
