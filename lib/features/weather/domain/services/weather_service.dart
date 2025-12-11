import 'package:sky_cast_weather/features/weather/data/models/weather_response.dart';

abstract class WeatherService{
  Future<List<WeatherResponse>> get10daysWeather();
  Future<>
}