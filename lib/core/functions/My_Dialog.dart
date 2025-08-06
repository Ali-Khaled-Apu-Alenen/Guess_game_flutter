import 'package:ecommerce/core/constant/colorapp.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/dialog/dialog_route.dart';

my_Dialog(String errorMessage) {
  Get.dialog(
  AlertDialog(
    backgroundColor: AppColor.onboardingcolor,
    elevation: 2,
    title: Text('Error', style: TextStyle(color: AppColor.icontprimary)),
    content: Text(errorMessage,style: TextStyle(color: AppColor.begincolortext),),
    actions: [
      TextButton(
        onPressed: () => Get.back(),
        child: Text('OK'),
      ),
      
    ],
  ),
);

}