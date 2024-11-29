import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_forms/constants.dart';
import 'package:smart_forms/presentation/components/text.dart';
import 'package:smart_forms/presentation/pages/add_field/add_field_page_controller.dart';

class TextOptionSelector extends StatelessWidget {
  const TextOptionSelector({super.key, required this.addFieldPageController});

  final AddFieldPageController addFieldPageController;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: addFieldPageController.textFieldType.value == 'single'
                    ? Constants.blueHighlight.withOpacity(0.15)
                    : Colors.transparent,
                border: addFieldPageController.textFieldType.value == 'single'
                    ? Border.all(
                        color: Constants.blueHighlight,
                        width: 2,
                      )
                    : Border.all(
                        color: Constants.gray300,
                        width: 1,
                      ),
                borderRadius: const BorderRadius.horizontal(
                  left: Radius.circular(10.5),
                ),
              ),
              child: Material(
                type: MaterialType.transparency,
                child: InkWell(
                  borderRadius: const BorderRadius.horizontal(
                    left: Radius.circular(10.5),
                  ),
                  onTap: () {
                    addFieldPageController.textFieldType.value = 'single';
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: addFieldPageController.textFieldType.value ==
                                'single'
                            ? 12
                            : 13),
                    child: Center(
                      child: Text(
                        Constants.single,
                        style: addFieldPageController.textFieldType.value ==
                                'single'
                            ? textStyles[TextSize.sm]!.copyWith(
                                fontWeight: FontWeight.bold,
                                color: Constants.gray800,
                              )
                            : textStyles[TextSize.sm]!.copyWith(
                                fontWeight: FontWeight.w400,
                                color: Constants.gray600,
                              ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: addFieldPageController.textFieldType.value == 'multiline'
                    ? Constants.blueHighlight.withOpacity(0.15)
                    : Colors.transparent,
                border:
                    addFieldPageController.textFieldType.value == 'multiline'
                        ? Border.all(
                            color: Constants.blueHighlight,
                            width: 2,
                          )
                        : Border.all(
                            color: Constants.gray300,
                            width: 1,
                          ),
                borderRadius: const BorderRadius.horizontal(
                  right: Radius.circular(10.5),
                ),
              ),
              child: Material(
                type: MaterialType.transparency,
                child: InkWell(
                  borderRadius: const BorderRadius.horizontal(
                    right: Radius.circular(10.5),
                  ),
                  onTap: () {
                    addFieldPageController.textFieldType.value = 'multiline';
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: addFieldPageController.textFieldType.value ==
                                'multiline'
                            ? 12
                            : 13),
                    child: Center(
                      child: Text(
                        Constants.paragraph,
                        style: addFieldPageController.textFieldType.value ==
                                'multiline'
                            ? textStyles[TextSize.sm]!.copyWith(
                                fontWeight: FontWeight.bold,
                                color: Constants.gray800,
                              )
                            : textStyles[TextSize.sm]!.copyWith(
                                fontWeight: FontWeight.w400,
                                color: Constants.gray600,
                              ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
