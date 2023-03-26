enum Symbols {
  addition(symbol: "+", compute: _addition),
  substraction(symbol: "-", compute: _substraction),
  division(symbol: "/", compute: _division),
  multiplication(symbol: "*", compute: _multiplication);

  factory Symbols.fromString(String symbol) {
    return Symbols.values.firstWhere((element) => element.symbol == symbol);
  }

  const Symbols({
    required this.symbol,
    required this.compute,
  });

  final String symbol;
  final double Function(double a, double b) compute;

  static double _addition(double a, double b) => a + b;
  static double _substraction(double a, double b) => a - b;
  static double _division(double a, double b) => a / b;
  static double _multiplication(double a, double b) => a * b;
}
