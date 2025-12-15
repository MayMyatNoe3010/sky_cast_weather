extension KelvinTemperatureExtension on double {
  //C = K - 273.15
  double get toCelsius {
    return this - 273.15;
  }

  //F = (K - 273.15) * 1.8 + 32
  double get toFahrenheit {
    final celsius = this - 273.15;
    return (celsius * 1.8) + 32;
  }

  String toCelsiusString([int decimalPlaces = 1]) {
    return '${toCelsius.toStringAsFixed(decimalPlaces)} °C';
  }

  String toFahrenheitString([int decimalPlaces = 1]) {
    return '${toFahrenheit.toStringAsFixed(decimalPlaces)} °F';
  }
}
