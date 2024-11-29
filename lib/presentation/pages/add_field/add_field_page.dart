import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:smart_forms/models/form_field.dart';
import 'package:smart_forms/presentation/components/components.dart';
import 'package:smart_forms/constants.dart';
import 'package:smart_forms/presentation/pages/add_field/options_list_manager.dart';
import 'package:smart_forms/presentation/pages/add_field/text_option_selector.dart';

import 'add_field_page_controller.dart';
import 'field_type_selector.dart';

const icons = [
  Constants.iconDropdown,
  Constants.iconRename,
  Constants.iconCheckbox,
  Constants.iconOwnerUser,
  Constants.iconHome,
  Constants.iconPin,
  Constants.iconMoney,
  Constants.iconCalendar,
  Constants.iconTasks,
  Constants.iconContacts,
  Constants.iconSettings,
  Constants.iconPieChart,
  Constants.iconLineChart,
  Constants.iconTextDescription,
  Constants.iconEmail,
  Constants.iconProposalDesignPlus,
  Constants.iconResume,
  Constants.iconStar,
  Constants.iconLikeWon,
  Constants.iconLikeLost,
  Constants.iconConstruction,
  Constants.iconPhone,
  Constants.iconWebsiteInternetGlobe,
  Constants.iconInfo,
  Constants.iconSustainabilityEco,
  Constants.iconChat,
  Constants.iconMicrosite,
  Constants.iconEdit,
  Constants.iconColumnChart,
  Constants.iconWarning,
  Constants.iconFormula,
  Constants.iconNumber,
  Constants.iconDropdown,
  Constants.iconMoney,
  Constants.iconTags,
];

class AddFieldPage extends StatelessWidget {
  const AddFieldPage({super.key});

  @override
  Widget build(BuildContext context) {
    final addFieldPageController = Get.put(AddFieldPageController());

    return ClipRRect(
      borderRadius: const BorderRadius.vertical(
        top: Radius.circular(17.5),
      ),
      child: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(14),
              child: Row(
                children: [
                  const TextBase.bold(Constants.addField),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      Get.delete<AddFieldPageController>();
                      Get.back();
                    },
                    child: const TextBase(
                      Constants.cancel,
                      style: TextStyle(
                        color: Constants.blueHighlight,
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),

                  // Done button
                  Button.small(
                    onPressed: () {
                      Get.back<MarkFormField>(
                          result: addFieldPageController.formField);
                      Get.delete<AddFieldPageController>();
                    },
                    text: Constants.done,
                  )
                ],
              ),
            ),
            const Divider(
              height: 1,
              color: Constants.gray300,
            ),
            Expanded(
              child: SingleChildScrollView(
                padding:
                    const EdgeInsets.symmetric(horizontal: 46, vertical: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextXS.bold(Constants.icon.toUpperCase()),
                    const SizedBox(height: 4),
                    Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Constants.gray200,
                        borderRadius: BorderRadius.circular(10.5),
                      ),
                      child: Wrap(
                        spacing: 5,
                        runSpacing: 5,
                        children: [
                          ...icons.map(
                            (assetPath) => ObxValue(
                              (data) => SelectableIcon(
                                assetPath: assetPath,
                                isSelected:
                                    addFieldPageController.iconPath.value ==
                                        assetPath,
                                onPressed: () => addFieldPageController
                                    .iconPath.value = assetPath,
                              ),
                              false.obs,
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextXS.bold(Constants.fieldName.toUpperCase()),
                    const SizedBox(height: 4),
                    TextField(
                      controller: addFieldPageController.textFieldController,
                      style: textStyles[TextSize.sm],
                      cursorColor: Constants.gray500,
                      decoration: InputDecoration(
                        hintText: Constants.formTitle,
                        hintStyle: textStyles[TextSize.sm]
                            ?.copyWith(color: Constants.gray500),
                        border: formBorderStyle,
                        enabledBorder: formBorderStyle,
                        focusedBorder: formBorderStyle,
                      ),
                      onChanged: (value) =>
                          addFieldPageController.name.value = value,
                    ),
                    const SizedBox(height: 20),
                    TextXS.bold(Constants.fieldType.toUpperCase()),
                    const SizedBox(height: 4),
                    Obx(
                      () => TextField(
                        controller: TextEditingController(
                            text: addFieldPageController.type.value),
                        readOnly: true,
                        style: textStyles[TextSize.sm],
                        decoration: InputDecoration(
                          border: formBorderStyle,
                          enabledBorder: formBorderStyle,
                          focusedBorder: formBorderStyle,
                          suffixIcon: SizedBox(
                            width: 8,
                            child: Center(
                              child:
                                  SvgPicture.asset(Constants.iconChevronDown),
                            ),
                          ),
                          hintText: Constants.formTitle,
                          hintStyle: textStyles[TextSize.sm]
                              ?.copyWith(color: Constants.gray500),
                        ),
                        onTap: () async {
                          await Get.bottomSheet(Column(
                            children: [
                              const NotchArea(),
                              Expanded(
                                child: FieldTypeSelector<String>(
                                  onSelect: (value) {
                                    addFieldPageController.options.clear();
                                    addFieldPageController.optionsKeys.clear();
                                    addFieldPageController.type.value = value;
                                  },
                                ),
                              ),
                            ],
                          ));
                        },
                      ),
                    ),


                    // TODO: This section should be extracted to a factory or other delegation to apply separation of concerns
                    Obx(() {
                      return addFieldPageController.type.value == 'text'
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                const SizedBox(height: 20),
                                TextXS.bold(
                                    Constants.textOptions.toUpperCase()),
                                const SizedBox(height: 5),
                                TextOptionSelector(
                                    addFieldPageController:
                                        addFieldPageController),
                              ],
                            )
                          : const SizedBox.shrink();
                    }),
                    Obx(() {
                      return addFieldPageController.type.value == 'dropdown'
                          ? OptionListManager(
                              itemLabel: Constants.dropdownItems,
                            )
                          : const SizedBox.shrink();
                    }),
                    Obx(() {
                      return addFieldPageController.type.value == 'checkbox'
                          ? OptionListManager(
                              itemLabel: Constants.checkboxItems,
                            )
                          : const SizedBox.shrink();
                    }),
                    // ---------------------------
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
