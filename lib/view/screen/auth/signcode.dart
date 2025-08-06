import 'package:ecommerce/controller/signcodecontroller.dart';
import 'package:ecommerce/core/constant/colorapp.dart';
import 'package:ecommerce/core/constant/routs.dart';
import 'package:ecommerce/view/widget/login/paddingpar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

class Singncode extends StatelessWidget {
  const Singncode({super.key});

  @override
  Widget build(BuildContext context) {
    SignCodeControllerimp signCodeController = Get.put(SignCodeControllerimp());
      final user = FirebaseAuth.instance.currentUser;
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
          onPressed: ()async {
          await  FirebaseAuth.instance.signOut();
            Get.offNamed(AppRoute.login);
          },
        ),
      ),
      body: Column(
        children: [
          Text(
            "Verify your Email first",
            style: Get.theme.textTheme.headlineMedium,
          ),

          SizedBox(height: 30),
          ElevatedButton(
            onPressed: () {
              user
                  ?.sendEmailVerification()
                  .then((value) {
                    Get.snackbar(
                      "Email sent",
                      "Please check your email to verify your account.",
                    );
                  })
                  .catchError((error) {
                    Get.snackbar("Error", error.toString());
                  });
            },
            child: Text("Send request"),
          ),
          ElevatedButton(
            onPressed: ()async {
            
            await  user?.reload();
            final refreshedUser = FirebaseAuth.instance.currentUser;
              if (refreshedUser!.emailVerified == true) {
                Get.offAllNamed(AppRoute.successverify);
              } else {
                Get.snackbar("Error", "Email not verified yet.");
              }
            },
            child: Text("Check Email Verification"),
          ),
          // OtpTextField(
          //   numberOfFields: 5,

          //   textStyle: TextStyle(
          //     color: Colors.white,
          //     fontSize: 20,
          //     fontWeight: FontWeight.bold,
          //   ),

          //   borderColor: Color(0xFF512DA8),
          //   //set to true to show as box or false to show as dash
          //   showFieldAsBox: true,
          //   //runs when a code is typed in
          //   onCodeChanged: (String code) {},
          //   //runs when every textfield is filled
          //   onSubmit: (String verificationCode) {

          //           signCodeController.gobacktoputcode();

          //   }, // end onSubmit
          // ),
        ],
      ),
    );
  }
}
