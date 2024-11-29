import 'package:flutter/material.dart';
import 'package:smart_forms/constants.dart';
import 'package:smart_forms/presentation/components/text.dart';

class Button extends StatelessWidget {
  Button.small({super.key, required this.onPressed, this.text})
      : style = ElevatedButton.styleFrom(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(7))),
          padding: const EdgeInsets.fromLTRB(7, 5, 7, 6),
          backgroundColor: Constants.blueHighlight,
          disabledBackgroundColor: Constants.blueHighlight.withOpacity(0.3),
          foregroundColor: Colors.white,
          disabledForegroundColor: Colors.white,
          minimumSize: const Size.fromHeight(24.0),
        ),
        textStyle =
            textStyles[TextSize.xs]!.copyWith(fontWeight: FontWeight.bold);

  Button.jumbo({super.key, required this.onPressed, this.text})
      : style = ElevatedButton.styleFrom(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(35))),
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 20),
          backgroundColor: Constants.blueHighlight,
          disabledBackgroundColor: Constants.blueHighlight.withOpacity(0.3),
          foregroundColor: Colors.white,
          disabledForegroundColor: Colors.white,
          minimumSize: const Size.fromHeight(56.0),
        ),
        textStyle =
            textStyles[TextSize.base]!.copyWith(fontWeight: FontWeight.bold);

  final void Function()? onPressed;
  final String? text;
  final ButtonStyle style;
  final TextStyle textStyle;

  @override
  Widget build(context) {
    return IntrinsicWidth(
      child: ElevatedButton(
        style: style,
        onPressed: onPressed,
        child: Text(
          text ?? '',
          style: textStyle,
        ),
      ),
    );
  }
}
