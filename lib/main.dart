import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:smart_forms/buttons.dart';
import 'package:smart_forms/constants.dart';
import 'package:smart_forms/new_form_page.dart';

void main() {
  runApp(
    const GetMaterialApp(
      home: MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Archivo',
        scaffoldBackgroundColor: Constants.gray200,
      ),
      home: Scaffold(
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
      ),
    );
  }
}
