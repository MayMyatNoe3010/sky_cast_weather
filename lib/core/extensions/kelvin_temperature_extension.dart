extension KelvinTemperatureExtension on double {
  /// Converts temperature from Kelvin (K) to Celsius (°C).
  /// Formula: C = K - 273.15
  double get toCelsius {
    return this - 273.15;
  }

  /// Converts temperature from Kelvin (K) to Fahrenheit (°F).
  /// Formula: F = (K - 273.15) * 1.8 + 32
  double get toFahrenheit {
    final celsius = this - 273.15;
    return (celsius * 1.8) + 32;
  }

  /// Formats the Celsius temperature to a string with one decimal place and the degree symbol.
  String toCelsiusString([int decimalPlaces = 1]) {
    return '${toCelsius.toStringAsFixed(decimalPlaces)} °C';
  }

  /// Formats the Fahrenheit temperature to a string with one decimal place and the degree symbol.
  String toFahrenheitString([int decimalPlaces = 1]) {
    return '${toFahrenheit.toStringAsFixed(decimalPlaces)} °F';
  }
}