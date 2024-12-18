import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:smart_forms/presentation/components/components.dart';
import 'package:smart_forms/constants.dart';

import '../form_list_page/form_list_page_controller.dart';
import '../new_form_page/new_form_page.dart';

class OpeningPage extends StatelessWidget {
  OpeningPage({super.key});

  final FormListPageController formsController =
      Get.put(FormListPageController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        if (formsController.forms.isNotEmpty) {
          // return FormListPage();
        }

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
                      const TextXL5.bold(Constants.smartForms),
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
                  onPressed: () => Get.bottomSheet(
                    Column(
                      children: [
                        NotchArea(rootContext: context),
                        Expanded(
                          child: NewFormPage(),
                        ),
                      ],
                    ),
                    isScrollControlled: true,
                  ),
                  text: Constants.createNewForm,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
