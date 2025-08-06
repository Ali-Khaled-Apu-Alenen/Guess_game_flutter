import 'package:ecommerce/core/class/animatcontroller.dart';
import 'package:ecommerce/core/constant/colorapp.dart';
import 'package:ecommerce/core/constant/routs.dart';
import 'package:ecommerce/view/widget/login/loginbutton.dart';
import 'package:ecommerce/view/widget/login/paddingpar.dart';
import 'package:ecommerce/view/widget/login/successicon.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class Successpage extends StatefulWidget {
  const Successpage({super.key});

  @override
  State<Successpage> createState() => _SuccesspageState();
}

class _SuccesspageState extends State<Successpage>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primarypackgroind,
      appBar: AppBar(
        backgroundColor: AppColor.primarypackgroind,
      
        centerTitle: true,
        leading: PaddingBar(
          onPressed: () {
            Get.offNamed(AppRoute.login);
          },
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("success verify", style: Get.theme.textTheme.headlineMedium),
          Successicon(),
          Loginbutton(
            txtname: "Go to home page",
            onPressed: () {
              Get.offAllNamed(AppRoute.homepage);
            },
          ),
        ],
      ),
    );
  }
}
