import 'package:ecommerce/controller/inputcontroller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PlayMessage extends StatefulWidget {
  const PlayMessage({super.key});

  @override
  State<PlayMessage> createState() => _PlayMessageState();
}

class _PlayMessageState extends State<PlayMessage> {
late  Inputcontroller inputcontroller;
  @override
  void initState() {
    inputcontroller = Get.put(Inputcontroller());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: inputcontroller,
      builder: (context, child) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Text(
                inputcontroller.winMessage(),
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
            Container(
              child: Text(
                "${inputcontroller.count}",
                style: TextStyle(
                  fontSize: 20,
                  color: inputcontroller.count > 5
                      ? Colors.blue
                      : inputcontroller.count > 0
                      ? Colors.yellow
                      : Colors.red,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
