import 'package:ecommerce/core/constant/routs.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

abstract class CheckPassword extends GetxController {
  check();
  gobacktologin();
}

class CheckPasswordimp extends CheckPassword {
  late TextEditingController emaill;

  @override
  void onInit() {
    emaill = TextEditingController();

    super.onInit();
  }

  @override
  check() {
    Get.toNamed(AppRoute.putcode);
    
  }

  @override
  gobacktologin() {
    // TODO: implement gobacktologin
    throw UnimplementedError();
  }
}
