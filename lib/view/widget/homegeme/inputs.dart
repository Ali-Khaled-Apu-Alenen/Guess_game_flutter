import 'package:ecommerce/controller/inputcontroller.dart';

import 'package:ecommerce/core/class/animatcontroller.dart';

import 'package:ecommerce/core/constant/constatnnums.dart';

import 'package:ecommerce/data/source/words.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';

class Inputs1 extends StatefulWidget {
  const Inputs1({super.key});

  @override
  State<Inputs1> createState() => _InputsState();
}

class _InputsState extends State<Inputs1> with SingleTickerProviderStateMixin {
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

  Inputcontroller inputcontroller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(Constatnnums.rowNums, (row) {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: List.generate(Constatnnums.inputNum, (col) {
            return AnimatedBuilder(
              animation: Listenable.merge([
                inputcontroller,
                animatControl.colortween,
              ]),
              builder: (context, child) {
                return Container(
                  margin: EdgeInsets.all(10),

                  width: 60,
                  height: 60,

                  child: TextField(
                    textAlign: TextAlign.center,

                    showCursor: false,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(bottom: 10),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(
                          color: inputcontroller.colorsbox[row][col],
                          width: 2,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),

                        borderSide: BorderSide(
                          color: animatControl.colortween.value!,
                          width: 3,
                        ),
                      ),
                    ),
                    enabled: inputcontroller.enabled[row][col],
                    controller: inputcontroller.textEditingController[row][col],
                    focusNode: inputcontroller.focusscope[row][col],

                    buildCounter:
                        (
                          _, {
                          required currentLength,
                          required isFocused,
                          required maxLength,
                        }) => null,
                    maxLength: 1,
                    onChanged: (value) {
                      if (inputcontroller
                          .textEditingController[row][col]
                          .text
                          .isNotEmpty) {
                        FocusScope.of(context).nextFocus();
                      }
                      if (inputcontroller.currentRow == row &&
                          value.isNotEmpty) {
                        inputcontroller.currentInput[col] = value[0];
                      }

                      // ✅ Now you can check
                      if (inputcontroller.currentRow == row &&
                          inputcontroller.currentInput.every(
                            (ele) => ele.isNotEmpty,
                          )) {
                        if (inputcontroller
                            .checklitter(Words.word)
                            .every((ele) => ele == Colors.green)) {
                          inputcontroller.count++;
                          List<Color> newcolor = inputcontroller.checklitter(
                            Words.word,
                          );
                          inputcontroller.colorboxset(row, newcolor);
                          // Optional: reset currentInput for next row
                          inputcontroller.currentInput = List.filled(
                            Constatnnums.inputNum,
                            "",
                          );
                          inputcontroller.message = true;
                        } else {
                          inputcontroller.changeNextEnabled();
                          List<Color> newcolor = inputcontroller.checklitter(
                            Words.word,
                          );
                          inputcontroller.colorboxset(row, newcolor);
                          // Optional: reset currentInput for next row
                          inputcontroller.currentInput = List.filled(
                            Constatnnums.inputNum,
                            "",
                          );
                        }
                      }
                    },
                  ),
                );
              },
            );
          }),
        );
      }),
    );
  }
}
