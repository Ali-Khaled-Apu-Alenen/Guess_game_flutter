import 'package:ecommerce/core/class/animatcontroller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';

class Loginbutton extends StatefulWidget {
  final String txtname;
  final void Function()? onPressed;
  const Loginbutton({super.key, required this.txtname, this.onPressed});

  @override
  State<Loginbutton> createState() => _LoginbuttonState();
}

class _LoginbuttonState extends State<Loginbutton>
    with SingleTickerProviderStateMixin {
  late AnimatControl animatControl;
  @override
  void initState() {
    super.initState();

    if (Get.isRegistered<AnimatControl>()) {
      Get.delete<AnimatControl>();
    }

    animatControl = Get.put(AnimatControl(ticker: this));
  }

  @override
  void dispose() {
    Get.delete<AnimatControl>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animatControl.colortween,
      builder: (context, child) {
        return Container(
          alignment: Alignment.center,

          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.9, // Responsive
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: animatControl.colorstween().value,

                minimumSize: Size(380, 60),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              child: Text(
                widget.txtname,
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                Future.delayed(Duration(milliseconds: 100), () {
                  if (widget.onPressed != null) widget.onPressed!();
                });
                
              },
            ),
            
          ),
        );
      },
    );
  }
}
