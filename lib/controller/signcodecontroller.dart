import 'package:ecommerce/core/constant/routs.dart';
import 'package:get/get.dart';

abstract class SignCodeController extends GetxController {
  checkcode();
  gobacktoputcode();
}

class SignCodeControllerimp extends SignCodeController {
  late String verificationCode;

  @override
  checkcode() {
    // TODO: implement checkcode
    throw UnimplementedError();
  }

  @override
  gobacktoputcode() {
    Get.offNamed(AppRoute.signverify);
  }
}
