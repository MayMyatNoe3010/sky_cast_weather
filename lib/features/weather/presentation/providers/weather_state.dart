import '../../domain/entities/forecast_item.dart';

class WeatherState {
  final List<ForecastItem> today3Hour;
  final List<ForecastItem> fiveDaysNoon;

  WeatherState({
    required this.today3Hour,
    required this.fiveDaysNoon,
  });
}
