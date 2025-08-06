import 'package:ecommerce/core/constant/colorapp.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class OnBoardingAnimate extends GetxController {
  late Animation<Color?> colortween;
  late AnimationController controllercolor;
  final TickerProvider ticker;
  OnBoardingAnimate({required this.ticker});
  @override
  void onInit() {
    controllercolor = AnimationController(
      vsync: ticker,
      duration: Duration(seconds: 1),
    );
    colortween = ColorTween(
      begin: AppColor.onboardingcolor,
      end: AppColor.icontbackprimary,
    ).animate(controllercolor);
    controllercolor.forward();

  }

  colorstween() {
    return colortween;
  }


}
