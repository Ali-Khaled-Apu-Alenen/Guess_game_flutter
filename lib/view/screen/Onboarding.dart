import 'package:ecommerce/controller/onboarding_controller.dart';
import 'package:ecommerce/core/class/onboarding_animate.dart';

import 'package:ecommerce/core/constant/colorapp.dart';
import 'package:ecommerce/view/widget/onboarding/onboardingbutton.dart';
import 'package:ecommerce/view/widget/onboarding/onboardingdots.dart';
import 'package:ecommerce/view/widget/onboarding/onboardingpages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding>
    with SingleTickerProviderStateMixin {
  late OnBoardingAnimate onBoardingAnimate;

  @override
  void initState() {
    super.initState();
      Get.put(OnBoardingControllerImp());
    onBoardingAnimate = Get.put(
      OnBoardingAnimate(ticker: this),
    );
  }

  @override
  Widget build(BuildContext context) {
  
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
                      AnimatedContainer(
                          duration: Duration(milliseconds: 300),
                        width: double.infinity,

                        color: controller.currentchange < 2
                            ? AppColor.onboardingcolor
                            : AppColor.primarypackgroind,
                        child: OnBoardingButton(),
                      ),
                      AnimatedContainer(
                            duration: Duration(milliseconds: 300),
                          height: 80,
                          color: controller.currentchange < 2
                              ? AppColor.onboardingcolor
                              : AppColor.primarypackgroind,
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
