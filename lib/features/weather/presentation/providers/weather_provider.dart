import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sky_cast_weather/features/weather/domain/entities/forecast_item.dart';

import '../../../../core/services/dio_client.dart';
import '../../data/service/weather_service.dart';
import '../../domain/entities/city.dart';
import '../../domain/entities/coord.dart';
import '../../domain/entities/forecast.dart';
import '../../domain/entities/weather.dart';
final dioClientProvider = Provider<DioClient>((ref) {
  return DioClient();
});
final weatherServiceProvider = Provider<WeatherService>((ref) {
  final dio = ref.read(dioClientProvider);
  return WeatherService(dio);

});

final weatherProvider =
AsyncNotifierProvider<WeatherNotifier, Forecast>(
    WeatherNotifier.new);

class WeatherNotifier extends AsyncNotifier<Forecast> {
  late final WeatherService _service;

  @override
  FutureOr<Forecast> build() async {
    _service = ref.read(weatherServiceProvider);
    return await fetchWeather('');
  }
  Future<Forecast> fetchWeather(String city) async {
    state = const AsyncValue.loading();
    try {
      final data = await _service.getTodayWeatherDetail(city);
      state = AsyncValue.data(data);
      return data;
    } catch (e, st) {
      state = AsyncValue.error(e, st);
      return Forecast(count: 0, items: [], city: City(id: 0, name: '', coord: Coord(lat: 0, lon: 0), country: '', timezone: 0));
    }
  }

}
