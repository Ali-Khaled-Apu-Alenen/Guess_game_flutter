import 'package:ecommerce/core/constant/routs.dart';
import 'package:ecommerce/core/services/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class MiddleWareClass extends GetMiddleware {
  int? get priority => 0;
  MyServices myServices = Get.find();
  @override
  RouteSettings? redirect(String? route) {
    if(myServices.sharedPreferences.getString("onboarding")=="done"){
      return RouteSettings(name: AppRoute.login);
    }
  }
}
