import 'dart:math';

import 'package:calculus/pages/game/models/symbols.dart';

class CaluculationGenerator {
  static double _getRandomeRange({
    required double min,
    required double max,
    int? precision,
  }) {
    final value = min + Random().nextDouble() * (max - min);

    if (precision != null) {
      return num.parse(value.toStringAsFixed(precision)).toDouble();
    }

    return value;
  }

  static String generate({
    required double minValue,
    required double maxValue,
    required List<Symbols> symbols,
    required int maxCalculations,
    required int precision,
  }) {
    final Random random = Random();
    final double initialValue = _getRandomeRange(
      min: minValue,
      max: maxValue,
      precision: precision,
    );
    String operation = initialValue.toStringAsFixed(precision);

    for (int i = 0; i < maxCalculations; i++) {
      final Symbols symbol = symbols[random.nextInt(symbols.length)];
      final double value = _getRandomeRange(
        min: minValue,
        max: maxValue,
        precision: precision,
      );

      operation += " ${symbol.symbol} ${value.toStringAsFixed(precision)}";
    }

    return operation;
  }
}
