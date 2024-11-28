import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:smart_forms/presentation/components/components.dart';
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
                  _FieldTypeTile(
                    onTap: () {
                      onSelect?.call('text' as T);
                      Get.back();
                    },
                    leading: SvgPicture.asset(Constants.iconRename),
                    text: Constants.text,
                  ),
                  const Divider(
                    height: 1,
                    color: Constants.gray300,
                  ),
                  _FieldTypeTile(
                    onTap: () {
                      onSelect?.call('dropdown' as T);
                      Get.back();
                    },
                    leading: SvgPicture.asset(Constants.iconDropdown),
                    text: Constants.dropdown,
                  ),
                  const Divider(
                    height: 1,
                    color: Constants.gray300,
                  ),
                  _FieldTypeTile(
                    onTap: () {
                      onSelect?.call('checkbox' as T);
                      Get.back();
                    },
                    leading: SizedBox(
                      width: 16,
                      height: 16,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Constants.gray800,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(5.25),
                        ),
                        child: Center(
                          child: SvgPicture.asset(Constants.iconCheck),
                        ),
                      ),
                    ),
                    text: Constants.checkbox,
                  ),
                  const Divider(
                    height: 1,
                    color: Constants.gray300,
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

class _FieldTypeTile<T> extends StatelessWidget {
  const _FieldTypeTile({
    super.key,
    required this.onTap,
    this.leading,
    this.text,
  });

  final Widget? leading;
  final String? text;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 28, horizontal: 20),
        child: Row(
          children: [
            if (leading case final leading?) ...[
              leading,
              const SizedBox(width: 20),
            ],
            if (text case final text?)
              Text(
                text,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
