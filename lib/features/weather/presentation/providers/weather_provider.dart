import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
AsyncNotifierProvider<WeatherNotifier, List<Weather>>(
    WeatherNotifier.new);

class WeatherNotifier extends AsyncNotifier<List<Weather>> {
  late final WeatherService _service;

  @override
  FutureOr<List<Weather>> build() async {
    _service = ref.read(weatherServiceProvider);
    return await fetchWeathers();
  }
  Future<void> fetchWeather(String city) async {
    state = const AsyncValue.loading();
    try {
      final data = await _service.getWeathers(city);
      state = AsyncValue.data(data);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }


  Future<List<Weather>> fetchWeathers([String? date]) async {
    state = const AsyncValue.loading();

    try {
      final weathers = await _service.getWeathers();
      state = AsyncValue.data(weathers);
      return weathers;
    } catch (e, st) {
      state = AsyncValue.error(e, st);
      return [];
    }
  }

  Future<void> getWeathers(String date) async {
    await fetchWeathers(date);
  }
}
