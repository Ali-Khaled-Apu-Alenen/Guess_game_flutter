import 'package:ecommerce/controller/putcodeemail.dart';
import 'package:ecommerce/core/constant/colorapp.dart';
import 'package:ecommerce/core/constant/routs.dart';
import 'package:ecommerce/view/widget/login/loginbutton.dart';
import 'package:ecommerce/view/widget/login/paddingpar.dart';
import 'package:ecommerce/view/widget/login/textform.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

class Putcode extends StatelessWidget {
  const Putcode({super.key});

  @override
  Widget build(BuildContext context) {
    PutCodeEmailimp putCodeEmail = Get.put(PutCodeEmailimp());
    return Scaffold(
      backgroundColor: AppColor.primarypackgroind,
      appBar: AppBar(
        backgroundColor: AppColor.primarypackgroind,
        title: Text(
          "verify code check",
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
            "put your code from\n your email",
            style: Get.theme.textTheme.headlineMedium,
          ),

          SizedBox(height: 30),
          OtpTextField(
            numberOfFields: 5,

            textStyle: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),

            borderColor: Color(0xFF512DA8),
            //set to true to show as box or false to show as dash
            showFieldAsBox: true,
            //runs when a code is typed in
            onCodeChanged: (String code) {},
            //runs when every textfield is filled
            onSubmit: (String verificationCode) {
              
                    putCodeEmail.gobacktoputcode();
              
            }, // end onSubmit
          ),
        ],
      ),
    );
  }
}
