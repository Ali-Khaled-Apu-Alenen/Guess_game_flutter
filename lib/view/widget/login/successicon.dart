import 'package:ecommerce/core/class/animatcontroller.dart';
import 'package:ecommerce/core/constant/colorapp.dart';
import 'package:ecommerce/core/constant/routs.dart';
import 'package:ecommerce/view/widget/login/loginbutton.dart';
import 'package:ecommerce/view/widget/login/paddingpar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class Successicon extends StatefulWidget {
  const Successicon({super.key});

  @override
  State<Successicon> createState() => _SuccessiconState();
}

class _SuccessiconState extends State<Successicon>with SingleTickerProviderStateMixin {
  late AnimatControl animatControl;
  @override
  void initState() {
    super.initState();

    if (Get.isRegistered<AnimatControl>()) {
      Get.delete<AnimatControl>();
    }

    animatControl = Get.put(AnimatControl(ticker: this));
  }

  @override
  void dispose() {
    Get.delete<AnimatControl>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animatControl.colortween,
      builder: (context, child) {
        print(animatControl.colortween.value!);
        return Icon(
          Icons.check_circle_outline_outlined, size: 300,
        
          color: animatControl.colortween.value!,
        );
      },
    );
  }
}
