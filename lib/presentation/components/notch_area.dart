import 'package:flutter/material.dart';
import 'package:smart_forms/constants.dart';

class NotchArea extends StatelessWidget {
  const NotchArea({super.key, this.rootContext});

  final BuildContext? rootContext;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: MediaQuery.of(rootContext ?? context).padding.top),
        const SizedBox(height: 38.25), // Title size
        const SizedBox(height: 14), // Bottom padding
        Container(
          width: 50,
          height: 5,
          decoration: BoxDecoration(
            color: Constants.gray600,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
