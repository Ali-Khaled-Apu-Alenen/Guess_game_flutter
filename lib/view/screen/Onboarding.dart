import 'package:ecommerce/controller/onboarding_controller.dart';
import 'package:ecommerce/core/constant/colorapp.dart';
import 'package:ecommerce/view/widget/onboarding/onboardingbutton.dart';
import 'package:ecommerce/view/widget/onboarding/onboardingdots.dart';
import 'package:ecommerce/view/widget/onboarding/onboardingpages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OnBoardingControllerImp());
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(flex: 3, child: OnBoardingPages()),
            Expanded(
              flex: 1,
              child: GetBuilder<OnBoardingControllerImp>(
                builder: (controller) {
                  return Column(
                    children: [
                      OnBoardingDots(),
                      Container(
                        width: double.infinity,

                        color: controller.currentchange < 2
                            ? AppColor.onboardingcolor
                            : AppColor.primarypackgroind,
                        child: OnBoardingButton(),
                      ),
                      Expanded(
                        child: Container(
                          height: 80,
                          color: controller.currentchange < 2
                              ? AppColor.onboardingcolor
                              : AppColor.primarypackgroind,
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
