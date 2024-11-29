import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_forms/models/form_field.dart';
import 'package:smart_forms/presentation/factories/form_field_factory.dart';

class AddFieldPageController extends GetxController {
  final type = 'text'.obs;
  final name = ''.obs;
  final iconPath = ''.obs;

  final options = <String>[].obs;
  final optionsKeys = <String>[].obs;
  final textFieldType = 'single'.obs;

  final arguments = Get.arguments;

  final textFieldController = TextEditingController();
  final optionsTextFieldController = <TextEditingController>[].obs;

  MarkFormField get formField {
    return FormFieldFactory.create(toMap());
  }

  @override
  void onReady() {
    super.onReady();

    final currentFormField = arguments as MarkFormField?;
    if (currentFormField != null) {
      currentFormField.initControllerParameters(this);
      refresh();
    }
  }

  void reorder(int originIndex, int destinationIndex) {
    if (originIndex < destinationIndex) {
      destinationIndex -= 1;
    }
    final String option = options.removeAt(originIndex);

    options.insert(destinationIndex, option);

    final String optionKey = optionsKeys.removeAt(originIndex);
    optionsKeys.insert(destinationIndex, optionKey);

    final TextEditingController textFieldController =
        optionsTextFieldController.removeAt(originIndex);
    optionsTextFieldController.insert(destinationIndex, textFieldController);
  }

  Map<String, dynamic> toMap() {
    return {
      'id': DateTime.now().toString(),
      'type': type.value,
      'name': name.value,
      'textFieldType': textFieldType.value,
      'iconPath': iconPath.value,
      'options': options,
      'multiline': textFieldType.value == 'multiline',
    };
  }
}
