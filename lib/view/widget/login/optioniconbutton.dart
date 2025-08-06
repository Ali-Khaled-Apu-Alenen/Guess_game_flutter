import 'package:ecommerce/core/constant/colorapp.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class OptionIconButton extends StatelessWidget {
  final IconData name;
final  void Function()? onPressed;
  const OptionIconButton({super.key, required this.name,required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: 180,
        height: 60,
        margin: EdgeInsets.only(top: 50,left: 5,right: 5),      
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColor.icontbackprimary,
          shadowColor: Colors.white,elevation: 0.3,
          shape: RoundedRectangleBorder(  borderRadius: BorderRadius.circular(20),)
                  ),
                  
          onPressed:onPressed,
          child: FaIcon(name, color: AppColor.icontprimary, size: 30),
        ),
      ),
    );
  }
}
