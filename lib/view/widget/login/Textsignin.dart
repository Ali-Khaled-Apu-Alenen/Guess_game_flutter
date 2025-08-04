import 'package:ecommerce/core/constant/colorapp.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Textsignin extends StatelessWidget {
  final String txt1;
  final String txt2;
  final void Function()? onTap;
  const Textsignin({super.key, required this.txt1, required this.txt2, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(txt1,style: TextStyle(color: AppColor.primarytextlogin,fontWeight: FontWeight.bold,fontSize: 15),),
          InkWell(
            onTap:onTap ,
            child: Text(txt2,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 15),))
        ],
      ),
    );
  }
}