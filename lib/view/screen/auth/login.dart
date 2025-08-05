import 'package:ecommerce/controller/Textcontroller.dart';
import 'package:ecommerce/core/class/animatcontroller.dart';
import 'package:ecommerce/core/constant/colorapp.dart';
import 'package:ecommerce/core/constant/routs.dart';
import 'package:ecommerce/core/functions/checkinternet.dart';
import 'package:ecommerce/core/functions/validatfunc.dart';
import 'package:ecommerce/view/widget/login/Textsignin.dart';
import 'package:ecommerce/view/widget/login/loginbutton.dart';
import 'package:ecommerce/view/widget/login/optioniconbutton.dart';
import 'package:ecommerce/view/widget/login/paddingpar.dart';
import 'package:ecommerce/view/widget/login/textform.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> with SingleTickerProviderStateMixin {
  initdata()async{
    var res= await checkInternet();
    print( res);
  }
  @override
  void initState() {
    super.initState();
  initdata();
    // Ensure fresh ticker every time
    if (Get.isRegistered<AnimatControl>()) {
      Get.delete<AnimatControl>();
    }

    Get.put(AnimatControl(ticker: this));
  }

  @override
  Widget build(BuildContext context) {
    TextControllerimp textControllerimp = Get.put(TextControllerimp());
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.primarypackgroind,
        appBar: AppBar(
          backgroundColor: AppColor.primarypackgroind,
          title: Text("login page", style: Get.theme.textTheme.headlineMedium),
          centerTitle: true,
          leading: PaddingBar(
            onPressed: () {
              Get.offNamed(AppRoute.onBoard);
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Form(
            key: textControllerimp.validate,
            child: Column(
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
                      onPressed: () {},
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
                GetBuilder<TextControllerimp>(builder: (control)=>TextFormCustom(
                  secureText: textControllerimp.showpass,
                  onTapInkwell: () {
                    textControllerimp.hideorshow();
                  },
                  validator: (val) {
                    return validateFunc(val!, 5, 25, "password");
                  },
                  mycontroller: textControllerimp.password,
                  mylable: "Password",
                ),),
                Container(
                  alignment: Alignment.centerRight,
                  child: InkWell(
                    onTap: () {
                      Get.toNamed(AppRoute.checkpass);
                    },
                    child: Text(
                      "Forget password?",
                      style: TextStyle(color: AppColor.primaryoffwhite),
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Loginbutton(
                  txtname: "Log in",
                  onPressed: () {
                    textControllerimp.checkfirst();
                  },
                ),
                SizedBox(height: 30),
                Textsignin(
                  txt1: "Dont have an account ?",
                  txt2: "Sign in",
                  onTap: textControllerimp.login,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
