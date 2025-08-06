import 'package:ecommerce/core/class/Crud.dart';
import 'package:ecommerce/view/links.dart';

class TextData {
  Crud crud;
  TextData(this.crud);
  getData() async {
    var response = await crud.postData(Applink.test, {});
    response.fold((l) => l, (r) => r);
  }
}
