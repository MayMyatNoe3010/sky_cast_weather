

import 'weather_detail.dart';

import 'temperature.dart';

import 'feels_like.dart';

class Daily {
  final int dt;
  final int sunrise;
  final int sunset;
  final int moonrise;
  final int moonset;
  final double moonPhase;
  final String summary;
  final Temperature temp;
  final FeelsLike feelsLike;
  final int pressure;
  final int humidity;
  final double dewPoint;
  final double windSpeed;
  final int windDeg;
  final double? windGust;
  final List<WeatherDetail> weather;
  final int clouds;
  final double pop;
  final double? rain;
  final double uvi;

  Daily({
    required this.dt,
    required this.sunrise,
    required this.sunset,
    required this.moonrise,
    required this.moonset,
    required this.moonPhase,
    required this.summary,
    required this.temp,
    required this.feelsLike,
    required this.pressure,
    required this.humidity,
    required this.dewPoint,
    required this.windSpeed,
    required this.windDeg,
    this.windGust,
    required this.weather,
    required this.clouds,
    required this.pop,
    this.rain,
    required this.uvi,
  });
}
