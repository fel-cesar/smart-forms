import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:smart_forms/components/components.dart';
import 'package:smart_forms/constants.dart';
import 'package:smart_forms/pages/new_form_page.dart';

class OpeningPage extends StatelessWidget {
  const OpeningPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(Constants.projectMarkLogoSvg),
                  const SizedBox(height: 20),
                  const Text(
                    Constants.smartForms,
                    style: TextStyle(
                      color: Constants.gray800,
                      fontSize: 42,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(48),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(35),
              ),
              color: Colors.white,
            ),
            child: Button.jumbo(
              onPressed: () => Get.bottomSheet(const NewFormPage()),
              text: Constants.createNewForm,
            ),
          ),
        ],
      ),
    );
  }
}
