import 'package:flutter/material.dart';
import 'package:smart_forms/constants.dart';
import 'package:smart_forms/presentation/components/components.dart';

class MarkCheckboxGroup extends StatefulWidget {
  final List<String> options;

  const MarkCheckboxGroup({super.key, required this.options});

  @override
  MarkCheckboxGroupState createState() => MarkCheckboxGroupState();
}

class MarkCheckboxGroupState extends State<MarkCheckboxGroup> {
  late List<bool> _isChecked; // Tracks the state of each checkbox

  @override
  void initState() {
    super.initState();
    _isChecked = List<bool>.filled(widget.options.length, false);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: widget.options.asMap().entries.map((entry) {
        final index = entry.key;
        final label = entry.value;

        return Row(
          children: [
            Checkbox(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.25),
              ),
              side: const BorderSide(
                color: Constants.gray400,
                width: 2,
              ),
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              value: _isChecked[index],
              onChanged: (value) {
                setState(() {
                  _isChecked[index] = value ?? false;
                });
              },
            ),
            TextBase(label),
          ],
        );
      }).toList(),
    );
  }
}
