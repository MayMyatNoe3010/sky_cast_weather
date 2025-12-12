
import 'main_details.dart';
import 'wind.dart';
import 'clouds.dart';
import 'weather.dart';

class ForecastItem {
  final int timestamp;            // dt
  final MainDetails main;
  final List<Weather> weather;
  final Clouds clouds;
  final Wind wind;
  final int visibility;
  final double pop;
  final String dateText;          // dtTxt

  ForecastItem({
    required this.timestamp,
    required this.main,
    required this.weather,
    required this.clouds,
    required this.wind,
    required this.visibility,
    required this.pop,
    required this.dateText,
  });
}
