import 'package:ecommerce/controller/Textcontroller.dart';
import 'package:ecommerce/core/class/animatcontroller.dart';
import 'package:ecommerce/core/constant/colorapp.dart';
import 'package:ecommerce/core/constant/routs.dart';
import 'package:ecommerce/core/functions/My_Dialog.dart';
import 'package:ecommerce/core/functions/googleauth.dart';
import 'package:ecommerce/core/functions/validatfunc.dart';
import 'package:ecommerce/view/widget/login/Textsignin.dart';
import 'package:ecommerce/view/widget/login/loginbutton.dart';
import 'package:ecommerce/view/widget/login/optioniconbutton.dart';
import 'package:ecommerce/view/widget/login/paddingpar.dart';
import 'package:ecommerce/view/widget/login/textform.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/dialog/dialog_route.dart';

class Signin extends StatefulWidget {
  const Signin({super.key});

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();

    // Ensure fresh ticker every time
    if (Get.isRegistered<AnimatControl>()) {
      Get.delete<AnimatControl>();
    }

    Get.put(AnimatControl(ticker: this));
  }

  @override
  Widget build(BuildContext context) {
    TextControllerimp textControllerimp = Get.put(TextControllerimp());
    return Form(
      key: textControllerimp.validate,
      child: Scaffold(
        backgroundColor: AppColor.primarypackgroind,
        appBar: AppBar(
          backgroundColor: AppColor.primarypackgroind,
          title: Text(
            "Sign Up page",
            style: Get.theme.textTheme.headlineMedium,
          ),
          centerTitle: true,
          leading: PaddingBar(),
        ),
        body: Column(
          children: [
            SizedBox(height: 50),
            Text(
              "   Login with one of the following options",
              style: TextStyle(
                color: AppColor.primarytextlogin,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OptionIconButton(
                  name: FontAwesomeIcons.google,
                  onPressed: () {
                    signInWithGoogle().then((value) {
                      if (value != null) {
                        Get.offAllNamed(AppRoute.successverify);
                      } else {
                        my_Dialog("Google Sign-In failed.");
                      }
                    });
                  },
                ),
                OptionIconButton(
                  name: FontAwesomeIcons.facebook,
                  onPressed: () {},
                ),
              ],
            ),
            SizedBox(height: 50),
            TextFormCustom(
              secureText: false,
              validator: (val) {
                return validateFunc(val!, 5, 25, "email");
              },
              mycontroller: textControllerimp.email,
              mylable: "Email",
            ),
            TextFormCustom(
              secureText: textControllerimp.showpass,
              validator: (val) {
                return validateFunc(val!, 5, 25, "password");
              },
              mycontroller: textControllerimp.password,
              mylable: "Password",
            ),
            TextFormCustom(
              secureText: false,
              validator: (val) {
              
              },
              mycontroller: textControllerimp.phone,
              mylable: "Phone(optional)",
            ),
            SizedBox(height: 30),
            Loginbutton(
              txtname: "Sign in",
              onPressed: () async {
                try {
                  final credential = await FirebaseAuth.instance
                      .createUserWithEmailAndPassword(
                        email: textControllerimp.email.text,
                        password: textControllerimp.password.text,
                      );
                      Get.offAllNamed(AppRoute.signputcode);
                } on FirebaseAuthException catch (e) {
                  if (e.code == 'weak-password') {
                    my_Dialog("The password is too weak.");
                  } else if (e.code == 'invalid-email') {
                    my_Dialog("The email address is not valid.");
                  } else if (e.code == 'email-already-in-use') {
                    my_Dialog(
                      "The email address is already in use by another account.",
                    );
                  }
                } catch (e) {
                  print(e);
                }
              },
            ),
            SizedBox(height: 30),
            Textsignin(
              txt1: "You have an account ?",
              txt2: "Log in",
              onTap: textControllerimp.signin,
            ),
          ],
        ),
      ),
    );
  }
}
