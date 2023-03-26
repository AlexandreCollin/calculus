import 'package:calculus/pages/game/models/question.dart';
import 'package:calculus/pages/game/models/symbols.dart';
import 'package:calculus/pages/game/utils/answer_generator.dart';
import 'package:calculus/pages/game/utils/calculation_generator.dart';

enum Difficulty {
  easy(0, "Easy"),
  medium(1, "Medium"),
  hard(2, "Hard");

  const Difficulty(this.value, this.name);

  final int value;
  final String name;
}

class QuestionGenerator {
  static double _compute(String operation) {
    final List<String> values = operation.split(" ");
    double result = double.parse(values[0]);

    for (int i = 1; i < values.length; i += 2) {
      final Symbols symbol = Symbols.fromString(values[i]);
      final double value = double.parse(values[i + 1]);

      result = symbol.compute(result, value);
    }
    return result;
  }

  static Question _generate({
    required double minValue,
    required double maxValue,
    required List<Symbols> symbols,
    required int maxCalculations,
    required int precision,
  }) {
    final String operation = CaluculationGenerator.generate(
      minValue: minValue,
      maxValue: maxValue,
      symbols: symbols,
      maxCalculations: maxCalculations,
      precision: precision,
    );
    final double value = _compute(operation);

    return Question(
      operation: operation,
      value: value.toStringAsFixed(precision),
      answers: AnswerGenerator.generate(
        value: value,
        precision: precision,
      ),
    );
  }

  static Question easy() {
    return _generate(
      minValue: 1,
      maxValue: 9,
      symbols: [Symbols.addition],
      maxCalculations: 1,
      precision: 0,
    );
  }

  static Question medium() {
    return _generate(
      minValue: 1,
      maxValue: 100,
      symbols: [Symbols.addition],
      maxCalculations: 3,
      precision: 0,
    );
  }

  static Question hard() {
    return _generate(
      minValue: 1,
      maxValue: 9,
      symbols: [Symbols.addition],
      maxCalculations: 1,
      precision: 0,
    );
  }

  static Question byDifficulty(Difficulty difficulty) {
    switch (difficulty) {
      case Difficulty.easy:
        return easy();
      case Difficulty.medium:
        return medium();
      case Difficulty.hard:
        return hard();
    }
  }
}
