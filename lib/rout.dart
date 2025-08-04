import 'package:ecommerce/core/constant/routs.dart';
import 'package:ecommerce/core/middleware/middlewere.dart';
import 'package:ecommerce/view/screen/Onboarding.dart';
import 'package:ecommerce/view/screen/auth/checkpassword.dart';
import 'package:ecommerce/view/screen/auth/login.dart';
import 'package:ecommerce/view/screen/auth/putcode.dart';
import 'package:ecommerce/view/screen/auth/signup.dart';

import 'package:ecommerce/view/screen/auth/successpage.dart';
import 'package:ecommerce/view/screen/auth/successsignpage.dart';
import 'package:ecommerce/view/screen/homegame.dart';
import 'package:ecommerce/view/test.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';

List<GetPage<dynamic>>? routs =[
    GetPage(name:   "/", page: ()=> OnBoarding(),middlewares: [
      MiddleWareClass(),
    ]),
  GetPage(name:   AppRoute.login, page: ()=> Login()),
  GetPage(name:   AppRoute.signin, page: ()=> Signin()),
  GetPage(name:   AppRoute.checkpass, page: ()=>  Checkpassword()),
  GetPage(name:   AppRoute.putcode, page: ()=> Putcode() ),
  GetPage(name:   AppRoute.successverify, page: ()=> Successpage()),
  GetPage(name:   AppRoute.homepage, page: ()=> HomeGame()),
  GetPage(name:   AppRoute.signverify, page: ()=> SuccessSignPage()),

];
// Map<String, Widget Function(BuildContext)> routs = {
//   AppRoute.login: (context) => const Login(),
//   AppRoute.onBoard: (context) => const OnBoarding(),
//   AppRoute.signin: (context) => const Signin(),
//   AppRoute.checkpass: (context) => const Checkpassword(),
//   AppRoute.putcode: (context) => const Putcode(),
//   AppRoute.successverify: (context) => const Successpage(),
//   AppRoute.homepage: (context) => const HomeGame(),
//   AppRoute.signverify: (context) => const SuccessSignPage(),
// };
