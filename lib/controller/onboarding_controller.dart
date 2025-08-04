import 'package:ecommerce/core/constant/routs.dart';
import 'package:ecommerce/data/source/static.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

abstract class OnboardingController extends GetxController {
  onPageChanged(int index);
  next();
  updatee();
}

class OnBoardingControllerImp extends OnboardingController {
  late PageController pageController;
  int currentchange = 0;
  String buttontext = "Continue";
  
  @override
  onPageChanged(int index) {
    currentchange = index;
    update();
  }

  @override
  next() {
    currentchange++;
    if (currentchange > onBoardingList.length - 1) {
      Get.offAllNamed(AppRoute.login);
    }
    pageController.animateToPage(
      currentchange,
      duration: Duration(milliseconds: 800),
      curve: Curves.easeInOut,
    );
  }

  @override
  void onInit() {
    pageController = PageController();
    super.onInit();
  }

  @override
  updatee() {
    if (currentchange < onBoardingList.length - 1) {
      buttontext = "Continue";
      update();
    }

    if (currentchange == onBoardingList.length - 1) {
      buttontext = "Lits Start";
      update();
    }
  }
}
