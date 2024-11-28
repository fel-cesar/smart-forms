import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart_forms/constants.dart';

class SelectableIcon extends StatelessWidget {
  const SelectableIcon({
    super.key,
    required this.assetPath,
    required this.onPressed,
    this.isSelected = false,
  });

  final bool isSelected;
  final String assetPath;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 28,
      height: 28,
      child: GestureDetector(
        onTap: onPressed,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: isSelected ? Constants.blueHighlight : Colors.transparent,
              width: 2,
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(7),
            ),
          ),
          child: Center(
            child: SvgPicture.asset(
              assetPath,
              height: 16,
              width: 16,
            ),
          ),
        ),
      ),
    );
  }
}
