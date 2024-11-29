import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart_forms/constants.dart';
import 'package:smart_forms/presentation/components/components.dart';

class DashedInputListItem extends StatelessWidget {
  const DashedInputListItem({super.key, this.onTap});

  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      color: Constants.gray400,
      strokeWidth: 2,
      borderType: BorderType.RRect,
      dashPattern: const [3, 3],
      radius: const Radius.circular(14),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(14),
        child: ColoredBox(
          color: Constants.gray100,
          child: Material(
            type: MaterialType.transparency,
            child: InkWell(
              splashColor: Constants.gray100,
              onTap: onTap,
              child: Padding(
                padding: const EdgeInsets.all(18),
                child: Row(
                  children: [
                    SvgPicture.asset(Constants.iconPlusAdd),
                    const SizedBox(width: 16),
                    const Text(
                      Constants.addField,
                      style: TextStyle(
                        fontSize: 12.25,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class DashedAddItemButton extends StatelessWidget {
  const DashedAddItemButton({super.key, this.onTap});

  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      color: Constants.gray400,
      strokeWidth: 2,
      borderType: BorderType.RRect,
      dashPattern: const [3, 3],
      radius: const Radius.circular(14),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(14),
        child: Material(
          type: MaterialType.transparency,
          child: InkWell(
            splashColor: Constants.gray100,
            onTap: onTap,
            child: Padding(
              padding: const EdgeInsets.all(14),
              child: Center(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    border: Border.all(color: Constants.gray800),
                    borderRadius: BorderRadius.circular(21),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 7),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const TextSM.bold(Constants.addItem),
                        const SizedBox(width: 5),
                        SvgPicture.asset(
                          Constants.iconPlusAdd,
                          width: 8,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
