import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sky_cast_weather/features/weather/presentation/providers/weather_provider.dart';

import '../../domain/entities/forecast_item.dart';

final todayProvider = Provider<AsyncValue<List<ForecastItem>>>((ref) {
  final raw = ref.watch(weatherProvider);

  return raw.whenData((weather) {
    final now = DateTime.now();

    return weather.items.where((item) {
      final d = DateTime.parse(item.dateText);
      return d.year == now.year &&
          d.month == now.month &&
          d.day == now.day;
    }).toList();
  });
});
