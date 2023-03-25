import 'dart:math';

import 'package:calculus/pages/game/models/question.dart';

enum Symbols {
  addition,
  substraction,
  division,
  multiplication,
}

class QuestionGenerator {
  static Question veryEasy() {
    final Symbols symbol = Symbols.values[Random().nextInt(4)];

    return Question(operation: "", value: "");
  }
}
