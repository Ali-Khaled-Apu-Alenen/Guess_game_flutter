import 'dart:ui';


import 'package:get/get.dart';

import '../services/services.dart';

class LangController extends GetxController {
  Locale? language;
  MyServices myServices = Get.find();
  changeLang(String lang) {
    Locale locale = Locale(lang);
    myServices.sharedPreferences.setString("lang", lang);
    Get.updateLocale(locale);
  }

  @override
  void onInit() {
    String? getShared = myServices.sharedPreferences.getString("lang");
    if (getShared == "ar") {
      language = Locale("ar");
    }
  else  if (getShared == "en") {
      language = Locale("en");
    } else {
      language = Locale(Get.deviceLocale!.languageCode);
    }

    super.onInit();
  }
}
