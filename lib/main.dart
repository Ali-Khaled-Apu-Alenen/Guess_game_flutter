import 'package:ecommerce/binding/initbinding.dart';
import 'package:ecommerce/core/constant/colorapp.dart';
import 'package:ecommerce/core/localization/langcontroller.dart';
import 'package:ecommerce/core/localization/mytranslation.dart';
import 'package:ecommerce/core/services/services.dart';
import 'package:ecommerce/rout.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await InitialServices();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late LangController controller;
  @override
  void initState() {
    controller = Get.put(LangController());
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        print('User is signed in!');
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      translations: MyTranslation(),
      locale: controller.language,
      initialBinding: Initbinding(),
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
          bodySmall: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: AppColor.primaryoffwhite,
          ),
        ),
      ),

      getPages: routs,
    );
  }
}
