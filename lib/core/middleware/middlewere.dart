import 'package:ecommerce/core/constant/routs.dart';
import 'package:ecommerce/core/services/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class MiddleWareClass extends GetMiddleware {
  int? get priority => 0;
  MyServices myServices = Get.find();
  @override
  RouteSettings? redirect(String? route) {
if(myServices.sharedPreferences.getString("onboarding") == "done") {
      if(FirebaseAuth.instance.currentUser != null) {
      if(FirebaseAuth.instance.currentUser!.emailVerified) {
        return const RouteSettings(name: AppRoute.homepage);
      } else {
        return const RouteSettings(name: AppRoute.signputcode);
      }
    } else {
      return const RouteSettings(name: AppRoute.login);
    }
    }
    else{
      return const RouteSettings(name:"/");
    }
  }}

