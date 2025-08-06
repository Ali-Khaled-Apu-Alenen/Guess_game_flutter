import 'package:ecommerce/controller/onboarding_controller.dart';
import 'package:ecommerce/core/constant/colorapp.dart';
import 'package:ecommerce/data/source/static.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoardingPages extends GetView<OnBoardingControllerImp> {
  const OnBoardingPages({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: controller.pageController,

      onPageChanged: (value) {
        controller.onPageChanged(value);
        
        controller.updatee();
      },
      itemCount: onBoardingList.length,
      itemBuilder: (context, i) {
        return AnimatedContainer(
          duration: Duration(milliseconds: 300),
          color:i<2? AppColor.onboardingcolor:AppColor.primarypackgroind,
          child: Column(
            children: [
              SizedBox(height: 50),
              Text(
                onBoardingList[i].title!,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              SizedBox(height: 50),
              SizedBox(
                height: 200,
                child: Image.asset(
                  onBoardingList[i].image!,
                  fit: BoxFit.fill,
                  height: 300,
                ),
              ),
              Container(height: 150),
              Text(onBoardingList[i].body!, style: Get.theme.textTheme.bodySmall),
              Spacer(),
            ],
          ),
        );
      },
    );
  }
}
