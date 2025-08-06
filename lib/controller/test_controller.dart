import 'package:ecommerce/core/class/statusRequest.dart';
import 'package:ecommerce/core/functions/handledata.dart';
import 'package:ecommerce/data/datasource/remote/text_data.dart';
import 'package:get/get.dart';

class TestController extends GetxController {
  TextData textData = TextData(Get.find());
  List data = [];
late  StatusRequest statusRequest;
  getdata()async{
    statusRequest = StatusRequest.loading;
    var respnse = await textData.getData();
    statusRequest = handlingData(respnse);
    if(statusRequest == StatusRequest.success) {
    
        data.addAll(respnse['data']);
      
    }
    update();
}
  @override
onInit() {
    getdata();
    super.onInit();
  }
}