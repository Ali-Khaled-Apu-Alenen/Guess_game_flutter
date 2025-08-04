import 'package:ecommerce/controller/Textcontroller.dart';
import 'package:ecommerce/core/class/animatcontroller.dart';
import 'package:ecommerce/core/constant/colorapp.dart';
import 'package:ecommerce/core/constant/routs.dart';
import 'package:ecommerce/view/widget/login/loginbutton.dart';
import 'package:ecommerce/view/widget/login/paddingpar.dart';
import 'package:ecommerce/view/widget/login/successicon.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class SuccessSignPage extends StatefulWidget {
  const SuccessSignPage({super.key});

  @override
  State<SuccessSignPage> createState() => _SuccessSignPageState();
}

class _SuccessSignPageState extends State<SuccessSignPage>
    with SingleTickerProviderStateMixin {
          TextControllerimp textControllerimp = Get.put(TextControllerimp());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primarypackgroind,
      appBar: AppBar(
        backgroundColor: AppColor.primarypackgroind,
        title: Text(
          "verify page",
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
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("success verify", style: Get.theme.textTheme.headlineMedium),
          Successicon(),
          Loginbutton(
            txtname: "Go to Login",
            onPressed: () {
              Get.offAllNamed(AppRoute.login);
            },
          ),
        ],
      ),
    );
  }
}
