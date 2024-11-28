import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_forms/components/components.dart';
import 'package:smart_forms/constants.dart';

class FieldTypeSelector<T> extends StatelessWidget {
  const FieldTypeSelector({super.key, this.onSelect});

  final Function(T value)? onSelect;

  @override
  Widget build(BuildContext context) {
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
                    Constants.fieldType,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  Button.small(
                    onPressed: Get.back,
                    text: Constants.cancel,
                  )
                ],
              ),
            ),
            const Divider(
              height: 1,
              color: Constants.gray300,
            ),
            SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    leading: const Icon(Icons.text_fields),
                    title: const Text('Text'),
                    onTap: () {
                      // print('Text');
                      onSelect?.call('Text' as T);
                      Get.back();
                    },
                  ),
                  const Divider(
                    height: 1,
                    color: Constants.gray300,
                  ),
                  ListTile(
                    leading: const Icon(Icons.arrow_drop_down_circle_outlined),
                    title: const Text('Dropdown'),
                    onTap: () {
                      // print('Dropdown');
                      onSelect?.call('Dropdown' as T);
                      Get.back();
                    },
                  ),
                  const Divider(
                    height: 1,
                    color: Constants.gray300,
                  ),
                  ListTile(
                    leading: const Icon(Icons.check_box_outlined),
                    title: const Text('Checkbox'),
                    onTap: () {
                      // print('Checkbox');
                      onSelect?.call('Checkbox' as T);
                      Get.back();
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
