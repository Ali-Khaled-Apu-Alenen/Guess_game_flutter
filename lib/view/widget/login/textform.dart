import 'package:ecommerce/core/class/animatcontroller.dart';
import 'package:ecommerce/core/constant/colorapp.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class TextFormCustom extends StatefulWidget {
  final TextEditingController mycontroller;
  final String mylable;
  final bool secureText;
  final String? Function(String?)? validator;
  final Function()? onTapInkwell;
  const TextFormCustom({
    super.key,
    required this.mycontroller,
    required this.mylable,
    required this.validator,

    this.onTapInkwell,
    required this.secureText,
  });

  @override
  State<TextFormCustom> createState() => _TextFormCustomState();
}

class _TextFormCustomState extends State<TextFormCustom>
    with TickerProviderStateMixin {
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
    Get.delete<AnimatControl>(); // optional but clean
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animatControl.colortween,
      builder: (context, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Text(
              "   ${widget.mylable}",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: TextFormField(
                obscureText: widget.secureText,
                validator: widget.validator,
                controller: widget.mycontroller,
                style: TextStyle(color: AppColor.icontprimary, fontSize: 20),
                decoration: InputDecoration(
                  suffixIcon: Container(
                    width: 10,
                    height: 10,
                    child: InkWell(
                      onTap: widget.onTapInkwell,
                      child: Icon(
                        Icons.remove_red_eye_outlined,
                        color: widget.secureText
                            ? AppColor.primarytextlogin
                            :AppColor.primaryoffwhite,
                      ),
                    ),
                  ),
                  contentPadding: EdgeInsets.all(20),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 1,
                      color: AppColor.primarytextlogin,
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 2,
                      color: animatControl.colortween.value!,
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
