import 'package:ecommerce/controller/onboarding_controller.dart';
import 'package:ecommerce/core/constant/colorapp.dart';
import 'package:ecommerce/data/source/static.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class OnBoardingDots extends StatelessWidget {
  const OnBoardingDots({super.key});

  @override
  Widget build(BuildContext context) {

    return GetBuilder<OnBoardingControllerImp>(
      builder: (controller) => AnimatedContainer(
          duration: Duration(milliseconds: 300),
        color: controller.currentchange < 2 ? AppColor.onboardingcolor : AppColor.primarypackgroind,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            ...List.generate(onBoardingList.length, (i) {
        
              return AnimatedContainer(
                duration: Duration(milliseconds: 600),
                margin: EdgeInsets.all(4),
                height: 6,
                width: controller.currentchange == i ? 20 : 5,

                decoration: BoxDecoration(
                  color: AppColor.primaryColor,
                  borderRadius: BorderRadius.circular(10),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
