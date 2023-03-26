import 'package:calculus/pages/game/models/question.dart';
import 'package:calculus/pages/game/models/symbols.dart';
import 'package:calculus/pages/game/utils/answer_generator.dart';
import 'package:calculus/pages/game/utils/calculation_generator.dart';

class QuestionGenerator {
  static double _compute(String operation) {
    final List<String> values = operation.split(" ");
    double result = 0;

    for (int i = 0; i < values.length; i += 3) {
      final double value1 = double.parse(values[i]);
      final Symbols symbol = Symbols.fromString(values[i + 1]);
      final double value2 = double.parse(values[i + 2]);

      result += symbol.compute(value1, value2);
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
}
