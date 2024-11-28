import 'package:flutter/material.dart';
import 'package:smart_forms/constants.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Archivo',
        scaffoldBackgroundColor: Constants.gray200,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Constants.blueHighlight,
            foregroundColor: Colors.white,
          ),
        ),
      ),
      home: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('<LOGO GOES HERE>'),
                    SizedBox(height: 20),
                    Text(
                      Constants.smartForms,
                      style: TextStyle(
                        color: Constants.grey800,
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
              child: ElevatedButton(
                onPressed: () {},
                child: const Column(
                  children: [
                    SizedBox(height: 20),
                    Text(
                      Constants.createNewForm,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20),
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
