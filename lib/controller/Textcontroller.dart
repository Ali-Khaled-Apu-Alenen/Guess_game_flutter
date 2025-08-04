import 'package:ecommerce/core/constant/routs.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

abstract class Textcontroller extends GetxController {
  login();
  signin();
}

class TextControllerimp extends Textcontroller {
  late TextEditingController email;
  late TextEditingController password;
  late TextEditingController phone;
  late GlobalKey<FormState> validate;

  late bool showpass = true;
  hideorshow() {
    showpass = showpass == false ? true : false;
    update();
  }

  @override
  login() {
    Get.toNamed(AppRoute.signin);
  
  }

  checkfirst() {
    var formstate = validate.currentState;
    if (formstate!.validate()) {
      print("valid");
    } else {
      print("not valid");
    }
  }

  @override
  signin() {
    Get.toNamed(AppRoute.login);
  
  }

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    phone = TextEditingController();
    validate = GlobalKey<FormState>();

    super.onInit();
  }
}
