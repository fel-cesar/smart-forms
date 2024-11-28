import 'package:flutter/material.dart';
import 'package:smart_forms/components/components.dart';
import 'package:smart_forms/constants.dart';

class FormPage extends StatelessWidget {
  const FormPage({super.key});

  @override
  Widget build(context) {
    return Scaffold(
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
                child: const Padding(
                  padding: EdgeInsets.all(14),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      DashedInputListItem(),
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
