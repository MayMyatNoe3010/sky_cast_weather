import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sky_cast_weather/features/weather/presentation/providers/weather_provider.dart';

import '../../domain/entities/forecast_item.dart';

final fiveDaysNoonProvider = Provider<AsyncValue<List<ForecastItem>>>((ref) {
  final raw = ref.watch(weatherProvider);

  return raw.whenData((weather) {
    final Map<String, ForecastItem> daily = {};

    for (final item in weather.items) {
      final d = DateTime.parse(item.dateText);
      if (d.hour == 12) {
        final key = '${d.year}-${d.month}-${d.day}';
        daily.putIfAbsent(key, () => item);
      }
    }

    return daily.values.take(5).toList();
  });
});
