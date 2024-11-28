import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_forms/constants.dart';
import 'package:smart_forms/presentation/pages/opening_page/opening_page.dart';

void main() {
  runApp(
    GetMaterialApp(
      theme: ThemeData(
        fontFamily: 'Archivo',
        scaffoldBackgroundColor: Constants.gray200,
      ),
      home: OpeningPage(),
    ),
  );
}
