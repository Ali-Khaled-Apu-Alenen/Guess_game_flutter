import 'package:ecommerce/core/constant/colorapp.dart';
import 'package:ecommerce/core/localization/langcontroller.dart';
import 'package:ecommerce/core/localization/mytranslation.dart';
import 'package:ecommerce/core/services/services.dart';
import 'package:ecommerce/rout.dart';
import 'package:ecommerce/view/screen/Onboarding.dart';
import 'package:ecommerce/view/screen/auth/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
await  InitialServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
  LangController controller=  Get.put(LangController());
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      translations: MyTranslation(),
      locale: controller.language,
      theme: ThemeData(
        fontFamily: "Cairo",
        textTheme: TextTheme(
          headlineSmall: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: AppColor.icontprimary,
          ),
            headlineMedium: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          bodySmall: TextStyle(fontSize: 15, fontWeight: FontWeight.bold,color: AppColor.primaryoffwhite),
        ),
      ),
    
      
      getPages: routs,
    );
  }
}
