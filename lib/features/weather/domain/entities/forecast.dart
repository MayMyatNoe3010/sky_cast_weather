import '../../data/models/forecast_response.dart';
import 'city.dart';
import 'forecast_item.dart';

class Forecast {
  final int count;
  final List<ForecastItem> items;
  final City city;

  Forecast({
    required this.count,
    required this.items,
    required this.city,
  });
}
