import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_forms/components/components.dart';
import 'package:smart_forms/constants.dart';
import 'package:smart_forms/pages/add_field_page.dart';

class FormPage extends StatelessWidget {
  const FormPage({super.key});

  @override
  Widget build(context) {
    return Scaffold(
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton.filled(
            style: IconButton.styleFrom(
              backgroundColor: Constants.gray800,
              padding: const EdgeInsets.all(18),
            ),
            onPressed: () => Get.bottomSheet(const AddFieldPage()),
            icon: const Icon(
              Icons.add,
              size: 18,
            ),
          ),
          const SizedBox(width: 21),
          IconButton.filled(
            style: IconButton.styleFrom(
              backgroundColor: Constants.gray800,
              padding: const EdgeInsets.all(18),
            ),
            onPressed: () {},
            icon: const Icon(
              Icons.visibility,
              size: 18,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(14),
              child: Text(
                '[FORM TITLE]',
                style: TextStyle(
                  fontSize: 26.25,
                  fontWeight: FontWeight.bold,
                  color: Constants.gray800,
                ),
              ),
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(28),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(14),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      DashedInputListItem(
                        onTap: () => Get.bottomSheet(const AddFieldPage()),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
