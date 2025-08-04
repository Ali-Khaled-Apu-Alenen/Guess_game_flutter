import 'package:ecommerce/core/constant/routs.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

abstract class ResetPasswordControl extends GetxController {
  check();
  gobacktologin();
}

class Reserpasswordcontrolimp extends ResetPasswordControl {
  late TextEditingController newpass;
  late TextEditingController newpassagain;

  @override
  void onInit() {
    newpass = TextEditingController();
    newpassagain = TextEditingController();

    super.onInit();
  }

  @override
  void onClose() {
    newpass.dispose();
    newpass.dispose();
    super.onClose();
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
