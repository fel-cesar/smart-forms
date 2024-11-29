import 'package:flutter/material.dart';
import 'package:smart_forms/constants.dart';
import 'package:smart_forms/presentation/components/text.dart';

import 'ui_constants.dart';

class MarkTextField extends StatelessWidget {
  final String title;
  final String hintText;
  final bool multiline;

  const MarkTextField(
      {super.key, this.title = '', this.hintText = '', this.multiline = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title.isNotEmpty) Text(title),
        TextField(
          maxLines: multiline ? null : 1,
          style: textStyles[TextSize.sm],
          cursorColor: Constants.gray500,
          decoration: InputDecoration(
            hintText: Constants.typeHere,
            hintStyle: textStyles[TextSize.sm]?.copyWith(
              color: Constants.gray500,
            ),
            border: formBorderStyle,
            enabledBorder: formBorderStyle,
            focusedBorder: formBorderStyle,
          ),
        ),
      ],
    );
  }
}
