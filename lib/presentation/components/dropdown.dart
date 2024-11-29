import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart_forms/constants.dart';
import 'package:smart_forms/presentation/components/text.dart';

import 'ui_constants.dart';

class MarkDropdown extends StatefulWidget {
  final String label;
  final List<String> options;

  const MarkDropdown({
    super.key,
    required this.label,
    required this.options,
  });

  @override
  State<MarkDropdown> createState() => _MarkDropdownState();
}

class _MarkDropdownState extends State<MarkDropdown> {
  final TextEditingController controller = TextEditingController();
  String? selectedValue;

  late List<String> modifiedOptions;

  @override
  void initState() {
    super.initState();
    modifiedOptions = _getUniqueOptionsWithSuffix(widget.options);
    selectedValue = modifiedOptions.isNotEmpty ? modifiedOptions[0] : null;
  }

  List<String> _getUniqueOptionsWithSuffix(List<String> options) {
    Map<String, int> optionCounts = {};
    List<String> modifiedList = [];

    for (var option in options) {
      if (optionCounts.containsKey(option)) {
        // If the option is already seen, increment the counter
        optionCounts[option] = optionCounts[option]! + 1;
        // Append the counter suffix to the option value
        modifiedList.add('$option (${optionCounts[option]})');
      } else {
        // If it's the first time seeing the option, just add it
        optionCounts[option] = 1;
        modifiedList.add(option);
      }
    }

    return modifiedList;
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      icon: SizedBox(
        width: 8,
        child: Center(
          child: SvgPicture.asset(Constants.iconChevronDown),
        ),
      ),
      hint: const TextSM(
        Constants.select,
        style: TextStyle(color: Constants.gray500),
      ),
      decoration: const InputDecoration(
        border: formBorderStyle,
        enabledBorder: formBorderStyle,
        focusedBorder: formBorderStyle,
      ),
      value: selectedValue,
      items: modifiedOptions
          .map((option) => DropdownMenuItem<String>(
                value: option,
                child: TextBase(option),
              ))
          .toList(),
      onChanged: (String? value) {
        setState(() {
          selectedValue = value;
        });
      },
    );
  }
}
