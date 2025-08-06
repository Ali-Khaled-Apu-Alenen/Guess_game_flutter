import 'package:ecommerce/core/constant/colorapp.dart';
import 'package:flutter/material.dart';

class PaddingBar extends StatelessWidget {
  final void Function()? onPressed;
  const PaddingBar({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return  Padding(
        padding: const EdgeInsets.all(8.0),
      
        child: Material(
          color: AppColor.primarypackgroind,
          elevation: 4,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: Colors.white, width: 0.2),
            ),
            child: IconButton(
              onPressed:onPressed ,
              icon: Icon(Icons.arrow_back, color: Colors.white),
            ),
          ),
        ),
      );
    
  }
}
