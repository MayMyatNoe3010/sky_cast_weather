import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sky_cast_weather/features/weather/domain/entities/forecast_item.dart';

import '../../../../core/services/dio_client.dart';
import '../../data/service/weather_service.dart';
import '../../domain/entities/weather.dart';
final dioClientProvider = Provider<DioClient>((ref) {
  return DioClient();
});
final weatherServiceProvider = Provider<WeatherService>((ref) {
  final dio = ref.read(dioClientProvider);
  return WeatherService(dio);

});

final weatherProvider =
AsyncNotifierProvider<WeatherNotifier, List<ForecastItem>>(
    WeatherNotifier.new);

class WeatherNotifier extends AsyncNotifier<List<ForecastItem>> {
  late final WeatherService _service;

  @override
  FutureOr<List<ForecastItem>> build() async {
    _service = ref.read(weatherServiceProvider);
    return await fetchWeather('');
  }
  Future<List<ForecastItem>> fetchWeather(String city) async {
    state = const AsyncValue.loading();
    try {
      final data = await _service.getWeathers(city);
      state = AsyncValue.data(data.items);
      return data.items;
    } catch (e, st) {
      state = AsyncValue.error(e, st);
      return [];
    }
  }


  Future<List<ForecastItem>> fetchWeathers([String? date]) async {
    state = const AsyncValue.loading();

    try {
      final weathers = await _service.getWeathers();
      state = AsyncValue.data(weathers.items);
      return weathers.items;
    } catch (e, st) {
      state = AsyncValue.error(e, st);
      return [];
    }
  }

  Future<void> getWeathers(String date) async {
    await fetchWeathers(date);
  }
}
