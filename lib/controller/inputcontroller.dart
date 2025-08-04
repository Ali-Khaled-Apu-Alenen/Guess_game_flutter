import 'package:ecommerce/core/constant/constatnnums.dart';
import 'package:ecommerce/data/source/words.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Inputcontroller extends GetxController {
  final int numrows = Constatnnums.rowNums;
  List<List<TextEditingController>> textEditingController = [];
  List<List<Color>> colorsbox = [];
  List<String> currentInput = List.filled(Constatnnums.inputNum, "");
  List<List<bool>> enabled = [];
  List<List<FocusNode>> focusscope = [];
  List<List<bool>> readonly = [];
  int count = 0;
  Color red = Colors.red;
  Color green = Colors.green;
  Color yellow = Colors.yellow;
  bool message = false;
  int currentRow = 0;
  bool lost = false;
  @override
  void onInit() {
        Words.generateWord();
    for (int row = 0; row < numrows; row++) {
      textEditingController.add(
        List.generate(Constatnnums.inputNum, (_) => TextEditingController()),
      );
      colorsbox.add(List.generate(Constatnnums.inputNum, (_) => Colors.white));
      enabled.add(List.generate(Constatnnums.inputNum, (_) => row == 0));
      focusscope.add(List.generate(Constatnnums.inputNum, (_) => FocusNode()));
      readonly.add(List.generate(Constatnnums.inputNum, (_) => true));
      FocusScope.of(Get.context!).requestFocus(focusscope[currentRow][0]);
      for (int i = 0; i < 5; i++) {
        final r = row;
        final String text = textEditingController[row][i].text;
        if (r == currentRow && text.isNotEmpty) {
          currentInput[i] = text[0];
        }
      }
    }
    super.onInit();
  }

  changeEnabled(int row, int col) {
    enabled[row][col] = false;
    readonly[row][col] = false;
    update();
  }

  List<Color> checklitter(String word) {
    List<Color> resultc = List.filled(Constatnnums.inputNum, red);
    List<bool> match = List.filled(Constatnnums.inputNum, false);
    for (int i = 0; i < Constatnnums.inputNum; i++) {
      if (currentInput[i] == word[i]) {
        resultc[i] = green;
        match[i] = true;
      }
    }
    for (int i = 0; i < Constatnnums.inputNum; i++) {
      if (match[i] == true)
        continue;
      else {
        for (int j = 0; j < Constatnnums.inputNum; j++) {
          if (currentInput[i] == word[j] && j != i && !match[j]) {
            resultc[i] = yellow;
            break;
          }
        }
      }
    }
    return resultc;
  }

  void changeNextEnabled() {
    if (currentRow + 1 < numrows) {
      for (int i = 0; i < Constatnnums.inputNum; i++) {
        enabled[currentRow + 1][i] = true;
        Future.delayed(Duration(milliseconds: 100), () {
          FocusScope.of(Get.context!).requestFocus(focusscope[currentRow][0]);
        });
      }
      currentRow++; // 🔁 Move to next row
      update();
    } else {
      lost = true;
      update();
    }
  }

  colorboxset(int row, List<Color> color) {
    for (int i = 0; i < Constatnnums.inputNum; i++) {
      colorsbox[row][i] = color[i];
    }
    update();
  }

  String winMessage() {
    if (lost == false) {
      if (message) {
        return "You won Your record";
      }
      return "Have fun , Your current won is ";
    }
    return "sorry you lost the word is ${Words.word}";
  }

  void resetGame() {
    Words.generateWord();
    lost = false;
    for (int i = 0; i < Constatnnums.rowNums; i++) {
      for (int j = 0; j < Constatnnums.inputNum; j++) {
        textEditingController[i][j].clear();
        enabled[i][j] = i == 0;
        colorsbox[i][j] = Colors.white;
      }
    }

    // Reset focus nodes
    for (var row in focusscope) {
      for (var node in row) {
        node.unfocus();
      }
    }

    currentRow = 0;
    currentInput = List.filled(Constatnnums.inputNum, "");
    message = false;

    update();
  }
}
