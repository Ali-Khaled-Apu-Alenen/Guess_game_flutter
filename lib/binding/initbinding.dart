import 'package:ecommerce/core/class/Crud.dart';
import 'package:get/get.dart';

class Initbinding extends Bindings {
  @override
  void dependencies() {
    Get.put(Crud());
  }
}
