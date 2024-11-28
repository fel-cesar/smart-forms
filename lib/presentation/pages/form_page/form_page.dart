import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:smart_forms/models/form_field.dart';
import 'package:smart_forms/presentation/components/components.dart';
import 'package:smart_forms/constants.dart';
import 'package:smart_forms/presentation/pages/add_field/add_field_page.dart';
import 'package:smart_forms/presentation/pages/form_list_page/form_list_page_controller.dart';
import 'package:smart_forms/presentation/pages/form_page/form_page_controller.dart';
import 'package:smart_forms/presentation/pages/form_preview_page/form_preview_page.dart';

class FormPage extends StatelessWidget {
  FormPage({super.key});

  final formController =
      Get.put(FormPageController(title: (Get.arguments as RxString).value));
  @override
  Widget build(context) {
    return Scaffold(
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton.filled(
            style: IconButton.styleFrom(
              backgroundColor: Constants.gray800,
              padding: const EdgeInsets.all(18),
            ),
            onPressed: () {
              final formListController = Get.find<FormListPageController>();
              formListController.addForm(formController.form);
              Get.back();
            },
            icon: const Icon(
              Icons.check,
              size: 18,
            ),
          ),
          const SizedBox(width: 21),

          // Add field button
          IconButton.filled(
            style: IconButton.styleFrom(
              backgroundColor: Constants.gray800,
              padding: const EdgeInsets.all(18),
            ),
            onPressed: () async {
              final formField = await Get.bottomSheet<MarkFormField?>(
                Column(
                  children: [
                    NotchArea(rootContext: context),
                    const Expanded(
                      child: AddFieldPage(),
                    ),
                  ],
                ),
                isScrollControlled: true,
              );

              if (formField != null) {
                formController.fields.add(formField);
              }
            },
            icon: const Icon(
              Icons.add,
              size: 18,
            ),
          ),
          const SizedBox(width: 21),
          IconButton.filled(
            style: IconButton.styleFrom(
              backgroundColor: Constants.gray800,
              padding: const EdgeInsets.all(18),
            ),
            onPressed: () {
              Get.to(FormPreviewPage(), transition: Transition.noTransition);
            },
            icon: const Icon(
              Icons.visibility,
              size: 18,
            ),
          ),
          const SizedBox(width: 21),
        ],
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(14, 0, 14, 14),
              child: TextXL3.bold(formController.form.title),
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(28),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(14),
                  child: Obx(() {
                    return ReorderableListView.builder(
                      footer: DashedInputListItem(
                        onTap: () async {
                          // Add FIELD tile
                          final newFormField =
                              await Get.bottomSheet<MarkFormField?>(
                            Column(
                              children: [
                                NotchArea(rootContext: context),
                                const Expanded(
                                  child: AddFieldPage(),
                                ),
                              ],
                            ),
                            isScrollControlled: true,
                          );

                          print(newFormField.toString());
                          if (newFormField != null) {
                            formController.fields.add(newFormField);
                          }
                        },
                      ),
                      onReorder: (oldIndex, newIndex) {
                        formController.reorder(oldIndex, newIndex);
                      },
                      itemCount: formController.fields.length,
                      itemBuilder: (context, index) {
                        final formField = formController.fields[index];
                        return GestureDetector(
                          key: ValueKey(formField.id),
                          onTap: () async {
                            // TEMP EDITING
                            final newFormField =
                                await Get.bottomSheet<MarkFormField?>(
                              Column(
                                children: [
                                  NotchArea(rootContext: context),
                                  const Expanded(
                                    child: AddFieldPage(),
                                  ),
                                ],
                              ),
                              isScrollControlled: true,
                              settings: RouteSettings(
                                  arguments: formController.fields[index]),
                            );

                            print(newFormField.toString());
                            print(newFormField?.iconPath);

                            if (newFormField != null) {
                              formController.fields.removeAt(index);
                              formController.fields.insert(index, newFormField);
                              // formController.fields[index] = formField;
                              // formController.
                              // formController.update();
                            }
                          },
                          child: Padding(
                            key: ValueKey(formField.id),
                            padding: const EdgeInsets.only(bottom: 14),
                            child: DraggableInput(
                              leading: Row(
                                children: [
                                  ReorderableDragStartListener(
                                    index: index,
                                    child: const Icon(
                                      Icons.drag_indicator_sharp,
                                      color: Constants.gray600,
                                    ),
                                  ),

                                  // MarkIcon
                                  SizedBox(
                                    width: 28,
                                    height: 28,
                                    child: GestureDetector(
                                      // onTap: onPressed,
                                      child: Center(
                                        child: SvgPicture.asset(
                                          formField.iconPath,
                                          height: 16,
                                          width: 16,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              trailing: IconButton(
                                icon: const Icon(
                                  Icons.more_horiz,
                                  color: Constants.gray800,
                                ),
                                onPressed: () =>
                                    formController.removeField(formField.id),
                              ),
                              child:
                                  TextBase(formController.fields[index].label),
                            ),
                          ),
                        );
                      },
                    );
                  }),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DraggableInput extends StatelessWidget {
  const DraggableInput({
    super.key,
    required this.child,
    this.leading,
    this.trailing,
  });

  final Widget? leading;
  final Widget? trailing;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        border: Border.all(
          color: Constants.gray300,
          width: 1,
        ),
        color: Constants.gray100,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          if (leading case final leading?) ...[
            leading,
            const SizedBox(width: 20),
          ],
          Expanded(child: child),
          if (trailing case final trailing?) ...[
            const SizedBox(width: 20),
            trailing,
          ],
        ],
      ),
    );
  }
}
