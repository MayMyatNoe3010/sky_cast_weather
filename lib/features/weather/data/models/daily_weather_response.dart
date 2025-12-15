class DailyWeatherResponse {
  final DateTime date;
  final double minTemp;
  final double maxTemp;
  final String condition;
  final String icon;

  DailyWeatherResponse({
    required this.date,
    required this.minTemp,
    required this.maxTemp,
    required this.condition,
    required this.icon,
  });
}
