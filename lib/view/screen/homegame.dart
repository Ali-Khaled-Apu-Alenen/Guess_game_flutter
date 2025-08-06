import 'package:ecommerce/controller/inputcontroller.dart';
import 'package:ecommerce/core/constant/colorapp.dart';
import 'package:ecommerce/core/constant/routs.dart';
import 'package:ecommerce/view/widget/homegeme/Playmessage.dart';

import 'package:ecommerce/view/widget/homegeme/inputs.dart';
import 'package:ecommerce/view/widget/login/loginbutton.dart';
import 'package:ecommerce/view/widget/login/paddingpar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

class HomeGame extends StatefulWidget {
  const HomeGame({super.key});

  @override
  State<HomeGame> createState() => _HomeGameState();
}

class _HomeGameState extends State<HomeGame> {
late  Inputcontroller inputcontroller;
  @override
  void initState() {
      inputcontroller = Get.put(Inputcontroller());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: AppColor.primarypackgroind,
        appBar: AppBar(
          backgroundColor: AppColor.primarypackgroind,
          title: Text("Guess game", style: Get.theme.textTheme.headlineMedium),
          centerTitle: true,
            leading: PaddingBar(
          onPressed: () {
            FirebaseAuth.instance.signOut();
              Get.offAllNamed(AppRoute.login);
          
        
          },
        ),
        ),
        body: SingleChildScrollView(
          child:  Column(
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
