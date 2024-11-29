import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_forms/constants.dart';
import 'package:smart_forms/presentation/components/dashed_input_list_item.dart';
import 'package:smart_forms/presentation/components/draggable_input.dart';
import 'package:smart_forms/presentation/components/text.dart';
import 'package:smart_forms/presentation/pages/add_field/add_field_page_controller.dart';

class OptionListManager extends StatelessWidget {
  final AddFieldPageController controller = Get.find();
  final String itemLabel;

  OptionListManager({
    required this.itemLabel,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextXS.bold(itemLabel.toUpperCase()),
          const SizedBox(height: 5),
          ReorderableListView.builder(
            onReorder: controller.reorder,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: controller.options.length,
            buildDefaultDragHandles: true,
            itemBuilder: (context, index) {
              return Padding(
                key: Key(controller.optionsKeys[index]),
                padding: const EdgeInsets.only(bottom: 14),
                child: DraggableInput(
                  leading: ReorderableDragStartListener(
                    index: index,
                    child: const Icon(Icons.drag_indicator_sharp,
                        color: Constants.gray600),
                  ),
                  child: TextField(
                    controller: controller.optionsTextFieldController.isNotEmpty
                        ? controller.optionsTextFieldController[index]
                        : null,
                    cursorColor: Constants.gray500,
                    style: textStyles[TextSize.sm],
                    onChanged: (value) {
                      controller.options[index] = value;
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
            key: const Key('button-add-field'),
            onTap: () {
              controller.options.add('');
              controller.optionsKeys.add(DateTime.now().toString());
              controller.optionsTextFieldController
                  .add(TextEditingController());
            },
          ),
        ],
      ),
    );
  }
}
