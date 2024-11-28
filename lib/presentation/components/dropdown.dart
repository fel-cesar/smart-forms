import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart_forms/constants.dart';
import 'package:smart_forms/presentation/components/text.dart';

import 'ui_constants.dart';

//TODO: options parameter?
//TODO: initial value parameter?
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
  // final RxString value;
  final TextEditingController controller = TextEditingController(text: '');

  String? selectedValue;

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
      items: widget.options
          .map((option) => DropdownMenuItem(
                value: option,
                child: TextBase(option),
              ))
          .toList(),
      onChanged: (value) {
        setState(() {
          selectedValue = value ?? '';
        });
      },
    );

    // return Obx(
    //   () => TextField(
    //     controller: controller,
    //     readOnly: true,
    //     onTap: () async {
    //       await Get.bottomSheet(FieldTypeSelector<String>(
    //         onSelect: (value) => controller.text = value,
    //       ));
    //     },

    //     style: const TextStyle(fontSize: 12.25),
    //     cursorColor: Constants.gray500,
    //     decoration: const InputDecoration(
    //       suffixIcon: Icon(Icons.arrow_drop_down_rounded),
    //       hintText: Constants.formTitle,
    //       hintStyle: TextStyle(
    //         color: Constants.gray500,
    //         fontSize: 12.25,
    //         fontWeight: FontWeight.w400,
    //       ),
    //       border: formBorderStyle,
    //       enabledBorder: formBorderStyle,
    //       focusedBorder: formBorderStyle,
    //     ),
    //   ),
    // );
  }
}
