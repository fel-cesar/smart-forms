import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_forms/constants.dart';

import '../components/components.dart';

class AddFieldPage extends StatelessWidget {
  const AddFieldPage({super.key});

  @override
  Widget build(BuildContext context) {
    const formBorderStyle = OutlineInputBorder(
      borderSide: BorderSide(
        color: Constants.gray400,
      ),
      borderRadius: BorderRadius.all(
        Radius.circular(17.5),
      ),
    );

    return ClipRRect(
      borderRadius: const BorderRadius.vertical(
        top: Radius.circular(17.5),
      ),
      child: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(14),
              child: Row(
                children: [
                  const Text(
                    Constants.addField,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: Get.back,
                    child: const Text(
                      Constants.cancel,
                      style: TextStyle(
                        color: Constants.blueHighlight,
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Button.small(
                    onPressed: null,
                    text: Constants.done,
                  )
                ],
              ),
            ),
            const Divider(
              height: 1,
              color: Constants.gray300,
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Icon'),
                    const SizedBox(height: 4),
                    Container(
                      color: Constants.gray200,
                      padding: const EdgeInsets.all(5),
                      child: Wrap(
                        spacing: 5,
                        runSpacing: 5,
                        children: [
                          ...List.generate(
                            35,
                            (index) => const SelectableIcon(
                              icon: Icons.biotech,
                              onPressed: null,
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text('Field Name'),
                    const SizedBox(height: 4),
                    const TextField(
                      style: TextStyle(fontSize: 12.25),
                      cursorColor: Constants.gray500,
                      decoration: InputDecoration(
                        hintText: Constants.formTitle,
                        hintStyle: TextStyle(
                          color: Constants.gray500,
                          fontSize: 12.25,
                          fontWeight: FontWeight.w400,
                        ),
                        border: formBorderStyle,
                        enabledBorder: formBorderStyle,
                        focusedBorder: formBorderStyle,
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text('Field Type'),
                    const SizedBox(height: 4),
                    const TextField(
                      style: TextStyle(fontSize: 12.25),
                      cursorColor: Constants.gray500,
                      decoration: InputDecoration(
                        hintText: Constants.formTitle,
                        hintStyle: TextStyle(
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
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
