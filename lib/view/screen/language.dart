import 'package:ecommerce/core/constant/colorapp.dart';
import 'package:ecommerce/core/constant/routs.dart';
import 'package:ecommerce/core/localization/langcontroller.dart';
import 'package:ecommerce/rout.dart';
import 'package:ecommerce/view/widget/language/changebutton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Language extends StatelessWidget {
  const Language({super.key});

  @override
  Widget build(BuildContext context) {
    LangController langController = Get.find();
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("change".tr, style: Get.theme.textTheme.headlineSmall),
            ChangeButton(
              setText: "arabic",
              onPressed: () {
                langController.changeLang("ar");
                Get.toNamed(AppRoute.onBoard);
              },
            ),
            ChangeButton(
              setText: "english",
              onPressed: () {
                langController.changeLang("en");
                Get.toNamed(AppRoute.onBoard);
              },
            ),
          ],
        ),
      ),
    );
  }
}
