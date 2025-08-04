import 'package:ecommerce/core/constant/colorapp.dart';
import 'package:flutter/material.dart';

class ChangeButton extends StatelessWidget {
  final String setText;
  final void Function()? onPressed;
  const ChangeButton({
    super.key,
    required this.setText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: MaterialButton(
        onPressed: onPressed,
        color: AppColor.primaryColor,
        padding: EdgeInsets.symmetric(horizontal: 100),
        child: Text(setText),
      ),
    );
  }
}
