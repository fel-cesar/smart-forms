import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:smart_forms/models/form_field.dart';
import 'package:smart_forms/presentation/components/components.dart';
import 'package:smart_forms/constants.dart';
import 'package:smart_forms/presentation/pages/form_page/form_page.dart';

import 'add_field_page_controller.dart';
import 'field_type_selector.dart';

const icons = [
  Constants.iconDropdown,
  Constants.iconRename,
  Constants.checkbox,
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
                    // TODO: extract this text field to components.
                    TextField(
                      controller:
                              addFieldPageController.textFieldController,
                      style: textStyles[TextSize.sm],
                      cursorColor: Constants.gray500,
                      decoration: InputDecoration(
                        hintText: Constants.formTitle,
                        hintStyle: textStyles[TextSize.sm]?.copyWith(color: Constants.gray500),
                        border: formBorderStyle,
                        enabledBorder: formBorderStyle,
                        focusedBorder: formBorderStyle,
                      ),
                      onChanged: (value) => addFieldPageController.name.value = value,
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
                              child: SvgPicture.asset(Constants.iconChevronDown),
                            ),
                          ),
                          hintText: Constants.formTitle,
                          hintStyle: textStyles[TextSize.sm]?.copyWith(color: Constants.gray500),
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

                    Obx(() {
                      return addFieldPageController.type.value == 'text'
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                const SizedBox(height: 20),
                                TextXS.bold(
                                    Constants.textOptions.toUpperCase()),
                                const SizedBox(height: 5),
                                _TextOptionSelector(
                                    addFieldPageController:
                                        addFieldPageController),
                              ],
                            )
                          : const SizedBox.shrink();
                    }),

                    Obx(() {
                      return addFieldPageController.type.value == 'dropdown'
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 20),
                                TextXS.bold(Constants.dropdownItems.toUpperCase()),
                                const SizedBox(height: 5),
                                ReorderableListView.builder(
                                  onReorder: (oldIndex, newIndex) {
                                    addFieldPageController.reorder(
                                        oldIndex, newIndex);
                                  },
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount:
                                      addFieldPageController.options.length,
                                  buildDefaultDragHandles: true,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      key: Key(addFieldPageController.optionsKeys[index]),
                                      padding: const EdgeInsets.only(bottom: 14),
                                      child: DraggableInput(
                                        leading: ReorderableDragStartListener(
                                          index: index,
                                          child: GestureDetector(
                                            child: const Icon(
                                              Icons.drag_indicator_sharp,
                                              color: Constants.gray600,
                                            ),
                                            onTapDown: (details) {
                                              FocusScope.of(context).unfocus();
                                            },
                                          ),
                                        ),
                                        child: TextField(
                                          controller: addFieldPageController.optionsTextFieldController.isNotEmpty ? addFieldPageController.optionsTextFieldController[index] : null,
                                          cursorColor: Constants.gray500,
                                          style: textStyles[TextSize.sm],
                                          onChanged: (value) {
                                            addFieldPageController.options[index] = value;
                                          },
                                          decoration: const InputDecoration(
                                            contentPadding: EdgeInsets.zero,
                                            border: OutlineInputBorder(borderSide: BorderSide.none),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                                DashedAddItemButton(
                                  key: const Key('button-add-field}'),
                                  onTap: () {
                                    addFieldPageController.options.add('');
                                    addFieldPageController.optionsKeys.add(DateTime.now().toString());
                                  },
                                ),
                              ],
                            )
                          : const SizedBox.shrink();
                    }),

                    Obx(() {
                      return addFieldPageController.type.value == 'checkbox'
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 20),
                                TextXS.bold(Constants.checkboxItems.toUpperCase()),
                                const SizedBox(height: 5),
                                ReorderableListView.builder(
                                  onReorder: (oldIndex, newIndex) {
                                    addFieldPageController.reorder(
                                        oldIndex, newIndex);
                                  },
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount:
                                      addFieldPageController.options.length,
                                  buildDefaultDragHandles: true,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      key: Key(addFieldPageController.optionsKeys[index]),
                                      padding: const EdgeInsets.only(bottom: 14),
                                      child: DraggableInput(
                                        leading: ReorderableDragStartListener(
                                          index: index,
                                          child: GestureDetector(
                                            child: const Icon(
                                              Icons.drag_indicator_sharp,
                                              color: Constants.gray600,
                                            ),
                                            onTapDown: (details) {
                                              FocusScope.of(context).unfocus();
                                            },
                                          ),
                                        ),
                                        child: TextField(
                                           controller: addFieldPageController.optionsTextFieldController.isNotEmpty ? addFieldPageController.optionsTextFieldController[index] : null,
                                          cursorColor: Constants.gray500,
                                          style: textStyles[TextSize.sm],
                                          onChanged: (value) {
                                            addFieldPageController.options[index] = value;
                                          },
                                          decoration: const InputDecoration(
                                            contentPadding: EdgeInsets.zero,
                                            border: OutlineInputBorder(borderSide: BorderSide.none),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                                DashedAddItemButton(
                                  key: const Key('button-add-field}'),
                                  onTap: () {
                                    addFieldPageController.options.add('');
                                    addFieldPageController.optionsKeys.add(DateTime.now().toString());
                                  },
                                ),
                              ],
                            )
                          : const SizedBox.shrink();
                    }),
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

// TODO: Refactor duplicate code.
class _TextOptionSelector extends StatelessWidget {
  const _TextOptionSelector({required this.addFieldPageController});

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
