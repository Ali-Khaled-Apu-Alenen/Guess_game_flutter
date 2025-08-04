import 'package:ecommerce/core/constant/routs.dart';
import 'package:get/get.dart';

abstract class PutCodeEmail extends GetxController {
  checkcode();
  gobacktoputcode();
}

class PutCodeEmailimp extends PutCodeEmail {
  late String verificationCode;

  @override
  checkcode() {
    // TODO: implement checkcode
    throw UnimplementedError();
  }

  @override
  gobacktoputcode() {
    Get.offNamed(AppRoute.homepage);
  }
}
