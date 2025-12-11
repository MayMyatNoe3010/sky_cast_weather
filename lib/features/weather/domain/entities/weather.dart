import 'alert.dart';
import 'current_weather.dart';
import 'daily.dart';
import 'hourly.dart';
import 'minutely.dart';

class Weather {
  final String cityName;
  final String condition;
  final double temperature;
  final String icon;
  final DateTime dateTime;

  Weather({
    required this.cityName,
    required this.condition,
    required this.temperature,
    required this.icon,
    required this.dateTime,
  });
}

