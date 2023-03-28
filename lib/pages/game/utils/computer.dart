import 'package:calculus/pages/game/models/symbols.dart';
import 'package:flutter/foundation.dart';

class Computer {
  static double _computeFinal(List<double> values) {
    double result = 0;
    for (final double value in values) {
      result += value;
    }
    return result;
  }

  static double _getValue({
    required String value,
    required bool isNeg,
  }) {
    if (isNeg) {
      return double.parse(value) * -1;
    } else {
      return double.parse(value);
    }
  }

  static List<double> _cleanOperationOfPriority(String operation) {
    final List<String> values = operation.split(" ");
    final List<double> result = [];
    bool isNeg = false;

    for (int i = 0; i < values.length - 1; i += 2) {
      final String value1 = values[i];
      final Symbols symbol = Symbols.fromString(values[i + 1]);

      if (symbol == Symbols.multiplication || symbol == Symbols.division) {
        final String value2 = values[i + 2];
        values.removeRange(i, i + 3);
        values.insert(
          i,
          symbol.compute(double.parse(value1), double.parse(value2)).toString(),
        );
        i -= 2;
      } else {
        result.add(_getValue(value: value1, isNeg: isNeg));
        isNeg = symbol == Symbols.substraction;
      }
    }
    result.add(_getValue(value: values.last, isNeg: isNeg));
    if (kDebugMode) {
      print(result);
    }
    return result;
  }

  static double compute(String operation) {
    final List<double> operationWithoutPriority =
        _cleanOperationOfPriority(operation);
    return _computeFinal(operationWithoutPriority);
  }
}
