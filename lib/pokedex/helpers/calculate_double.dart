class CalculateDouble {
  CalculateDouble();

  double calculateDoublePercentStats(int value) {
    double decimal = 0.0;

    if (value < 100) {
      final String s = "0.$value";
      final double d = double.parse(s);
      decimal = d / 2;
    } else {
      final newValue = (value / 2).round();
      final String s = "0.$newValue";
      final double d = double.parse(s);
      decimal = d;
    }

    return decimal;
  }
}
