import 'package:calculus/pages/game/models/symbols.dart';

class Computeur {
  static double _computeFinal(List<double> values) {
    double result = 0;
    for (final double value in values) {
      result += value;
    }
    return result;
  }

  // 2 * 3 * 4
  // 6 * 4

  static List<double> _cleanOperationOfPriority(String operation) {
    final List<String> values = operation.split(" ");
    final List<double> result = [];

    for (int i = 0; i < values.length - 1; i += 2) {
      final String value1 = values[i];
      final Symbols symbol = Symbols.fromString(values[i + 1]);

      print("$value1 $symbol");
      if (symbol == Symbols.multiplication || symbol == Symbols.division) {
        final String value2 = values[i + 2];
        values.removeRange(i, i + 3);
        values.insert(
          i,
          symbol.compute(double.parse(value1), double.parse(value2)).toString(),
        );
        i -= 2;
        print(" $value2");
        print(" $values");
      } else if (symbol == Symbols.substraction) {
        result.add(double.parse(value1) * -1);
      } else {
        result.add(double.parse(value1));
      }
    }
    result.add(double.parse(values.last));
    return result;
  }

  static double compute(String operation) {
    final List<double> operationWithoutPriority =
        _cleanOperationOfPriority(operation);
    return _computeFinal(operationWithoutPriority);
  }
}
