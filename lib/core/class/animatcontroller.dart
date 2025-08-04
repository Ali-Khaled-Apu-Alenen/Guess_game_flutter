import 'package:ecommerce/core/constant/colorapp.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class AnimatControl extends GetxController {
  late Animation<Color?> colortween;
  late AnimationController controllercolor;
  final TickerProvider ticker;
  AnimatControl({required this.ticker});
  @override
  void onInit() {
    controllercolor = AnimationController(
      vsync: ticker,
      duration: Duration(seconds: 1),
    );
    colortween = ColorTween(
      begin: AppColor.begincolortext,
      end: AppColor.endcolortext,
    ).animate(controllercolor);
    controllercolor.forward();
    controllercolor.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controllercolor.reverse();
      } else if (status == AnimationStatus.dismissed) {
        controllercolor.forward();
      }
    });
  }

  colorstween() {
    return colortween;
  }


}
