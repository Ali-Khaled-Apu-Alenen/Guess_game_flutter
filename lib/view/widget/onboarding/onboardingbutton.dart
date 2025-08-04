import 'package:ecommerce/controller/onboarding_controller.dart';
import 'package:ecommerce/core/constant/colorapp.dart';
import 'package:ecommerce/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoardingButton extends GetView<OnBoardingControllerImp> {
  const OnBoardingButton({super.key});

  @override
  Widget build(BuildContext context) {
    MyServices myServices = Get.find();
    return Container(
      margin: EdgeInsets.only(top: 60),

      child: MaterialButton(
        padding: EdgeInsets.symmetric(horizontal: 100, vertical: 20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(10),
        ),
        elevation: 10,
        color: AppColor.primaryColor,
        onPressed: () {
          controller.next();
          myServices.sharedPreferences.setString("onboarding", "done");
        },
        child: GetBuilder<OnBoardingControllerImp>(
          builder: (controller) {
            return Text(controller.buttontext);
          },
        ),
      ),
    );
  }
}
