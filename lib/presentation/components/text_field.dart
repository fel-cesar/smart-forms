import 'package:flutter/material.dart';
import 'package:smart_forms/constants.dart';

import 'ui_constants.dart';

class MarkTextField extends StatelessWidget {
  final String title;
  final String hintText;
  final bool multiline;

  const MarkTextField({super.key, this.title = '', this.hintText = '',  this.multiline = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title.isNotEmpty) Text(title), // TODO: Proper font and size here
        TextField(
          maxLines: multiline? null: 1,
          style: const TextStyle(fontSize: 12.25),
          cursorColor: Constants.gray500,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: const TextStyle(
              color: Constants.gray500,
              fontSize: 12.25,
              fontWeight: FontWeight.w400,
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
