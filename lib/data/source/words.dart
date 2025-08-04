import 'dart:math';

import 'package:ecommerce/data/source/wordsbase.dart';

class Words {
  static late String word;

  static void generateWord() {
    final random = Random();
    final wordsList = Wordsbase.fiveLetterWords;
    word = wordsList[random.nextInt(wordsList.length)];
    print(word);
  }
}
