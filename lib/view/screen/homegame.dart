import 'package:ecommerce/controller/inputcontroller.dart';
import 'package:ecommerce/core/constant/colorapp.dart';
import 'package:ecommerce/core/constant/routs.dart';
import 'package:ecommerce/view/widget/homegeme/Playmessage.dart';

import 'package:ecommerce/view/widget/homegeme/inputs.dart';
import 'package:ecommerce/view/widget/login/loginbutton.dart';
import 'package:ecommerce/view/widget/login/paddingpar.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

class HomeGame extends StatefulWidget {
  const HomeGame({super.key});

  @override
  State<HomeGame> createState() => _HomeGameState();
}

class _HomeGameState extends State<HomeGame> {
  Inputcontroller inputcontroller = Get.put(Inputcontroller());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.primarypackgroind,
        appBar: AppBar(
          backgroundColor: AppColor.primarypackgroind,
          title: Text("Guess game", style: Get.theme.textTheme.headlineMedium),
          centerTitle: true,
            leading: PaddingBar(
          onPressed: () {
            Get.offNamed(AppRoute.login);
          },
        ),
        ),
        body: Expanded(
          child: Column(
            children: [
              Inputs1(),
              PlayMessage(),
              SizedBox(height: 20),
              Loginbutton(
                txtname: "Check The Word?(reset)",
                onPressed: () {
                  inputcontroller.resetGame();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
