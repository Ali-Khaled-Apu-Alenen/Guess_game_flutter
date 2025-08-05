
import 'package:ecommerce/controller/reserpasswordcontrol.dart';
import 'package:ecommerce/core/constant/colorapp.dart';
import 'package:ecommerce/core/constant/customtheme.dart';
import 'package:ecommerce/core/constant/routs.dart';
import 'package:ecommerce/core/functions/validatfunc.dart';
import 'package:ecommerce/view/widget/login/loginbutton.dart';
import 'package:ecommerce/view/widget/login/paddingpar.dart';
import 'package:ecommerce/view/widget/login/textform.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    Reserpasswordcontrolimp reserpass = Get.put(Reserpasswordcontrolimp());
    return Scaffold(
      backgroundColor: AppColor.primarypackgroind,
      appBar: AppBar(
        backgroundColor: AppColor.primarypackgroind,
        title: Text(
          "Reset password page",
          style: Get.theme.textTheme.headlineMedium,
        ),
        centerTitle: true,
        leading: PaddingBar(
          onPressed: () {
            Get.offNamed(AppRoute.login);
          },
        ),
      ),
      body: Column(
        children: [
          Text("Reset your password here", style: Get.theme.textTheme.h1),
          TextFormCustom(
            secureText: true,
            validator: (val) {
              return validateFunc(val!, 5, 25, "password");
            },
            mycontroller: reserpass.newpass,
            mylable: "New password",
          ),
          SizedBox(height: 30),
          TextFormCustom(
            secureText: true,
            validator: (val) {
              return validateFunc(val!, 5, 25, "password");
            },
            mycontroller: reserpass.newpassagain,
            mylable: "put new password again",
          ),
          Loginbutton(
            txtname: "confirm",
            onPressed: () {
              Get.toNamed(AppRoute.successverify);
            },
          ),
        ],
      ),
    );
  }
}
