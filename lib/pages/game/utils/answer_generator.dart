import 'dart:math';

import 'package:flutter/foundation.dart';

class AnswerGenerator {
  static List<String> generate({
    required double value,
    required int precision,
  }) {
    List<String> answers = [];
    int percentage = 10;
    String correctAnwer = value.toStringAsFixed(precision);
    for (int i = 0; i < 3; i++) {
      String wrongAnswer = "";
      do {
        int deviation = (value * percentage / 100).floor();
        if (value < 0) deviation *= -1;
        double wrongValue =
            value + Random().nextInt(deviation * 2 + 1) - deviation;
        wrongAnswer = wrongValue.toStringAsFixed(precision);
        percentage += 10;
        if (kDebugMode) {
          print(wrongValue);
        }
      } while (answers.contains(wrongAnswer) || wrongAnswer == correctAnwer);
      answers.add(wrongAnswer);
    }
    answers.insert(Random().nextInt(3), correctAnwer);
    return answers;
  }
}
