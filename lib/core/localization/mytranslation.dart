import 'package:get/get.dart';
class MyTranslation extends Translations{
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {
    "ar":{
    "1" : "اهلا بك في تطبيفنا",
    "2":"عربي",
    "change":"تغيير اللغه ؟"
    },
    "en":{
      "1":"welcome in our app",
      "2":"english",
      "change":"Change language?"
    }
  };

}