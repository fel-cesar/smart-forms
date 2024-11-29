
import 'package:flutter/material.dart';
import 'package:smart_forms/constants.dart';

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
