import 'dart:math';

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
        wrongAnswer = (value + Random().nextInt(deviation * 2 + 1) - deviation)
            .toStringAsFixed(precision);
        percentage += 10;
      } while (answers.contains(wrongAnswer) || wrongAnswer == correctAnwer);
      answers.add(wrongAnswer);
    }
    answers.insert(1 + Random().nextInt(3), correctAnwer);
    return answers;
  }
}
