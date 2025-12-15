import 'package:flutter_test/flutter_test.dart';
import 'package:sky_cast_weather/core/extensions/kelvin_temperature_extension.dart';

void main() {
  const kelvinAbsoluteZero = 0.0;
  const kelvinFreezingPoint = 273.15; // 0°C
  const kelvinBoilingPoint = 373.15; // 100°C
  const kelvinRoomTemp = 293.15; // 20°C

  group('KelvinTemperatureExtension - Conversion Tests', () {
    test('toCelsius: Converts absolute zero (0 K) to -273.15 °C', () {
      expect(kelvinAbsoluteZero.toCelsius, closeTo(-273.15, 0.0001));
    });

    test('toCelsius: Converts freezing point (273.15 K) to 0.0 °C', () {
      expect(kelvinFreezingPoint.toCelsius, closeTo(0.0, 0.0001));
    });

    test('toCelsius: Converts boiling point (373.15 K) to 100.0 °C', () {
      expect(kelvinBoilingPoint.toCelsius, closeTo(100.0, 0.0001));
    });

    test('toFahrenheit: Converts absolute zero (0 K) to -459.67 °F', () {
      // F = (-273.15) * 1.8 + 32 = -459.67
      expect(kelvinAbsoluteZero.toFahrenheit, closeTo(-459.67, 0.0001));
    });

    test('toFahrenheit: Converts freezing point (273.15 K) to 32.0 °F', () {
      expect(kelvinFreezingPoint.toFahrenheit, closeTo(32.0, 0.0001));
    });

    test('toFahrenheit: Converts boiling point (373.15 K) to 212.0 °F', () {
      expect(kelvinBoilingPoint.toFahrenheit, closeTo(212.0, 0.0001));
    });
  });

  group('KelvinTemperatureExtension - String Formatting Tests', () {
    test(
        'toCelsiusString: Formats room temperature (20.0 °C) with 1 decimal place', () {
      expect(kelvinRoomTemp.toCelsiusString(), '20.0 °C');
    });

    test('toCelsiusString: Formats room temperature with 0 decimal places', () {
      expect(kelvinRoomTemp.toCelsiusString(0), '20 °C');
    });

    test(
        'toCelsiusString: Formats absolute zero (-273.15 °C) with 2 decimal places', () {
      expect(kelvinAbsoluteZero.toCelsiusString(2), '-273.15 °C');
    });
    test(
        'toFahrenheitString: Formats room temperature (68.0 °F) with 1 decimal place', () {
      expect(kelvinRoomTemp.toFahrenheitString(), '68.0 °F');
    });

    test(
        'toFahrenheitString: Formats room temperature with 0 decimal places', () {
      expect(kelvinRoomTemp.toFahrenheitString(0), '68 °F');
    });

    test(
        'toFahrenheitString: Formats freezing point (32.0 °F) with 3 decimal places', () {
      expect(kelvinFreezingPoint.toFahrenheitString(3), '32.000 °F');
    });
  });
}