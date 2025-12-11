import 'dart:async';
import 'dart:developer';

import '../../domain/entities/weather.dart';
final weatherProvider = StateNotifierProvider<WeatherNotifier, AsyncValue<List<Weather>>>((ref) => WeatherNotifier());
class WeatherNotifier extends StateNotifier<AsyncValue<List<Weather>>> {
  WeatherNotifier() : super(const AsyncLoading());

  Future<void> getWeathers(String date) async {
    print('GetWeather');
    state = const AsyncLoading();
    final userId = _client.getUserId();
    if (userId == null) {
      state = const AsyncValue.data([]);
      return;
    }


    try {
      //final result = await _client.fetchTodos(userId, date);
      final List<Weather> weathers = [];//(result as List).map((e) => WeatherDto.fromJson(e).toDomain()).toList();
      state = AsyncValue.data(weathers);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
    print(state);
  }

  Future<void> addWeather(Weather weather) async {
    final userId = _client.getUserId();
    if (userId == null) return;
    final dto = weather.toDto(userId);
    final result = await _client.addTodo(dto);
    state = state.whenData((weathers) => [...weathers, result.toDomain()]);
  }

  Future<void> toggleComplete(int weatherId) async {
    final currentState = state;
    if (currentState is! AsyncData) return;

    final weathers = currentState.value;
    final weather = weathers?.firstWhere((t) => t.id == weatherId);
    final updatedWeather = weather?.copyWith(isComplete: !weather.isComplete);
    if(updatedWeather != null){
    await _client.toggleIsComplete(updatedWeather);

    final updatedList = weathers?.map((t) => t.id == weatherId ? updatedWeather : t).toList();
    state = AsyncValue.data(updatedList!);}

  }
}
