import 'package:flutter/material.dart';
import 'package:smart_forms/constants.dart';

class FormPageActionButton extends StatelessWidget {
  final VoidCallback onSave;
  final VoidCallback onAddField;
  final VoidCallback onPreview;

  const FormPageActionButton({
    super.key,
    required this.onSave,
    required this.onAddField,
    required this.onPreview,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton.filled(
          style: IconButton.styleFrom(
            backgroundColor: Constants.gray800,
            padding: const EdgeInsets.all(18),
          ),
          onPressed: onSave,
          icon: const Icon(Icons.check, size: 18),
        ),
        const SizedBox(width: 21),
        IconButton.filled(
          style: IconButton.styleFrom(
            backgroundColor: Constants.gray800,
            padding: const EdgeInsets.all(18),
          ),
          onPressed: onAddField,
          icon: const Icon(Icons.add, size: 18),
        ),
        const SizedBox(width: 21),
        IconButton.filled(
          style: IconButton.styleFrom(
            backgroundColor: Constants.gray800,
            padding: const EdgeInsets.all(18),
          ),
          onPressed: onPreview,
          icon: const Icon(Icons.visibility, size: 18),
        ),
        const SizedBox(width: 21),
      ],
    );
  }
}
