import 'package:ecommerce/controller/checkpassword.dart';
import 'package:ecommerce/core/constant/colorapp.dart';
import 'package:ecommerce/core/constant/routs.dart';
import 'package:ecommerce/core/functions/validatfunc.dart';
import 'package:ecommerce/view/widget/login/loginbutton.dart';
import 'package:ecommerce/view/widget/login/paddingpar.dart';
import 'package:ecommerce/view/widget/login/textform.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Checkpassword extends StatelessWidget {
  const Checkpassword({super.key});

  @override
  Widget build(BuildContext context) {
    CheckPasswordimp checkPassword = Get.put(CheckPasswordimp());
    return Scaffold(
      backgroundColor: AppColor.primarypackgroind,
      appBar: AppBar(
        backgroundColor: AppColor.primarypackgroind,
        title: Text(
          "Change password page",
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
          Text(
            "Change password with\n your email",
            style: Get.theme.textTheme.headlineMedium,
          ),
          TextFormCustom(
            secureText: false,
              validator: (val) {
                  return validateFunc(val!, 5, 25, "email");
                },
            mycontroller: checkPassword.emaill,
            mylable: "Your Email",
          ),
          SizedBox(height: 30),
          Loginbutton(
            txtname: "Check",
            onPressed: () {
              Get.toNamed(AppRoute.putcode);
            },
          ),
        ],
      ),
    );
  }
}
