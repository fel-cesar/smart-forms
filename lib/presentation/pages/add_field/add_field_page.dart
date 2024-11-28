import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:smart_forms/presentation/components/components.dart';
import 'package:smart_forms/constants.dart';

import '../form_page/form_page_controller.dart';
import 'add_field_page_controller.dart';
import 'field_type_selector.dart';

const icons = [
  Constants.iconOwnerUser,
  Constants.iconHome,
  Constants.iconPin,
  Constants.iconMoney,
  Constants.iconCalendar,
  Constants.iconTasks,
  Constants.iconContacts,
  Constants.iconCalendar,
  Constants.iconSettings,
  // Constants.iconOwnerUser,
  Constants.iconPieChart,
  Constants.iconLineChart,
  Constants.iconRename,
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
  AddFieldPage({super.key});

  final formController = Get.find<FormPageController>();
  final addFieldPageController = AddFieldPageController();

  @override
  Widget build(BuildContext context) {
    const formBorderStyle = OutlineInputBorder(
      borderSide: BorderSide(
        color: Constants.gray400,
      ),
      borderRadius: BorderRadius.all(
        Radius.circular(17.5),
      ),
    );

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
                  const Text(
                    Constants.addField,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: const Text(
                      Constants.cancel,
                      style: TextStyle(
                        color: Constants.blueHighlight,
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Button.small(
                    onPressed: () {
                      formController.fields
                          .add(addFieldPageController.formField);
                      Get.back();
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
                    Text(
                      Constants.icon.toUpperCase(),
                      style: const TextStyle(
                        fontSize: 10.5,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
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
                                    addFieldPageController.iconName.value ==
                                        assetPath,
                                onPressed: () => addFieldPageController
                                    .iconName.value = assetPath,
                              ),
                              false.obs,
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      Constants.fieldName.toUpperCase(),
                      style: const TextStyle(
                        fontSize: 10.5,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    // TODO: extract this text field to components.
                    TextField(
                      style: const TextStyle(fontSize: 12.25),
                      cursorColor: Constants.gray500,
                      decoration: const InputDecoration(
                        hintText: Constants.formTitle,
                        hintStyle: TextStyle(
                          color: Constants.gray500,
                          fontSize: 12.25,
                          fontWeight: FontWeight.w400,
                        ),
                        border: formBorderStyle,
                        enabledBorder: formBorderStyle,
                        focusedBorder: formBorderStyle,
                      ),
                      onChanged: (value) =>
                          addFieldPageController.name.value = value,
                    ),
                    const SizedBox(height: 20),
                    Text(
                      Constants.fieldType.toUpperCase(),
                      style: const TextStyle(
                        fontSize: 10.5,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),

                    Obx(
                      () => TextField(
                        // TODO: get text from type
                        controller: TextEditingController(
                            text: addFieldPageController.type.value),
                        readOnly: true,
                        onTap: () async {
                          await Get.bottomSheet(FieldTypeSelector<String>(
                            onSelect: (value) {
                              addFieldPageController.options.clear();
                              addFieldPageController.type.value = value;
                            },
                          ));
                        },

                        style: const TextStyle(fontSize: 12.25),
                        cursorColor: Constants.gray500,
                        decoration: InputDecoration(
                          suffixIcon: SizedBox(
                            width: 8,
                            child: Center(
                              child:
                                  SvgPicture.asset(Constants.iconChevronDown),
                            ),
                          ),
                          hintText: Constants.formTitle,
                          hintStyle: const TextStyle(
                            color: Constants.gray500,
                            fontSize: 12.25,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),

                    Obx(() {
                      return addFieldPageController.type.value == 'text'
                          ? const Text('TEXT configs')
                          : const SizedBox.shrink();
                    }),

                    Obx(() {
                      return addFieldPageController.type.value == 'dropdown'
                          ? ReorderableListView.builder(
                              onReorder: (oldIndex, newIndex) {
                                // TODO: proper reordering
                              },
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount:
                                  addFieldPageController.options.length + 1,
                              buildDefaultDragHandles: true,
                              itemBuilder: (context, index) {
                                if (index <
                                    addFieldPageController.options.length) {
                                  return ListTile(
                                    key: Key(index.toString()),
                                    title: TextField(onChanged: (value) {
                                      addFieldPageController.options[index] =
                                          value;
                                    }),
                                    leading: ReorderableDragStartListener(
                                      index: index,
                                      child: const Icon(Icons.drag_handle),
                                    ),
                                  );
                                }
                                return Button.small(
                                  key: Key(index.toString()),
                                  text: 'add field',
                                  onPressed: () {
                                    addFieldPageController.options.add('');
                                  },
                                );
                              },
                            )
                          : const SizedBox.shrink();
                    }),

                    Obx(() {
                      return addFieldPageController.type.value == 'checkbox'
                          ? ReorderableListView.builder(
                              onReorder: (oldIndex, newIndex) {
                                // TODO: proper reordering
                              },
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount:
                                  addFieldPageController.options.length + 1,
                              buildDefaultDragHandles: true,
                              itemBuilder: (context, index) {
                                if (index <
                                    addFieldPageController.options.length) {
                                  return ListTile(
                                    key: Key(index.toString()),
                                    title: TextField(onChanged: (value) {
                                      addFieldPageController.options[index] =
                                          value;
                                    }),
                                    leading: ReorderableDragStartListener(
                                      index: index,
                                      child: const Icon(Icons.drag_handle),
                                    ),
                                  );
                                }
                                return Button.small(
                                  key: Key(index.toString()),
                                  text: 'add field',
                                  onPressed: () {
                                    addFieldPageController.options.add('');
                                  },
                                );
                              },
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
