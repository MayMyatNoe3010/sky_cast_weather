import '../../../../main.dart';
import '../../domain/entities/alert.dart';
import '../../domain/entities/current_weather.dart';
import '../../domain/entities/daily.dart';
import '../../domain/entities/feels_like.dart';
import '../../domain/entities/hourly.dart';
import '../../domain/entities/minutely.dart';
import '../../domain/entities/temperature.dart';
import '../../domain/entities/weather.dart';
import '../../domain/entities/weather_detail.dart';
import '../models/weather_response.dart';
extension WeatherMapper on WeatherResponse {
  Weather toDomainModel() {
    return Weather(
      cityName:  '',
      condition: weather.first.description,
      temperature: main.temp,
      icon: weather.first.icon,
      dateTime: DateTime.fromMillisecondsSinceEpoch(dt * 1000),
    );
  }
}
extension WeatherListMapper on List<WeatherResponse> {
  List<Weather> toDomainList() => map((e) => e.toDomainModel()).toList();
}
extension CurrentWeatherMapper on CurrentWeatherResponse {
  CurrentWeather toDomainModel() {
    return CurrentWeather(
      dt: dt ?? 0,
      sunrise: sunrise ?? 0,
      sunset: sunset ?? 0,
      temp: temp ?? 0,
      feelsLike: feelsLike ?? 0,
      pressure: pressure ?? 0,
      humidity: humidity ?? 0,
      dewPoint: dewPoint ?? 0,
      uvi: uvi ?? 0,
      clouds: clouds ?? 0,
      visibility: visibility ?? 0,
      windSpeed: windSpeed ?? 0,
      windDeg: windDeg ?? 0,
      windGust: windGust ?? 0,
      weather: weather?.map((e) => e.toDomainModel()).toList() ?? [],
    );
  }
}
extension MinutelyMapper on MinutelyResponse {
  Minutely toDomainModel() {
    return Minutely(
      dt: dt ?? 0,
      precipitation: precipitation ?? 0,
    );
  }
}
extension HourlyMapper on HourlyResponse {
  Hourly toDomainModel() {
    return Hourly(
      dt: dt ?? 0,
      temp: temp ?? 0,
      feelsLike: feelsLike ?? 0,
      pressure: pressure ?? 0,
      humidity: humidity ?? 0,
      dewPoint: dewPoint ?? 0,
      uvi: uvi ?? 0,
      clouds: clouds ?? 0,
      visibility: visibility ?? 0,
      windSpeed: windSpeed ?? 0,
      windDeg: windDeg ?? 0,
      windGust: windGust ?? 0,
      weather: weather?.map((e) => e.toDomainModel()).toList() ?? [],
      pop: pop ?? 0,
    );
  }
}
extension DailyMapper on DailyResponse {
  Daily toDomainModel() {
    return Daily(
      dt: dt ?? 0,
      sunrise: sunrise ?? 0,
      sunset: sunset ?? 0,
      moonrise: moonrise ?? 0,
      moonset: moonset ?? 0,
      moonPhase: moonPhase ?? 0,
      summary: summary ?? '',
      temp: temp?.toDomainModel() ?? Temperature(
        day: 0, min: 0, max: 0, night: 0, eve: 0, morn: 0,
      ),
      feelsLike: feelsLike?.toDomainModel() ?? FeelsLike(
        day: 0, night: 0, eve: 0, morn: 0,
      ),
      pressure: pressure ?? 0,
      humidity: humidity ?? 0,
      dewPoint: dewPoint ?? 0,
      windSpeed: windSpeed ?? 0,
      windDeg: windDeg ?? 0,
      windGust: windGust ?? 0,
      weather: weather?.map((e) => e.toDomainModel()).toList() ?? [],
      clouds: clouds ?? 0,
      pop: pop ?? 0,
      rain: rain ?? 0,
      uvi: uvi ?? 0,
    );
  }
}
extension TemperatureMapper on TemperatureResponse {
  Temperature toDomainModel() {
    return Temperature(
      day: day ?? 0,
      min: min ?? 0,
      max: max ?? 0,
      night: night ?? 0,
      eve: eve ?? 0,
      morn: morn ?? 0,
    );
  }
}
extension FeelsLikeMapper on FeelsLikeResponse {
  FeelsLike toDomainModel() {
    return FeelsLike(
      day: day ?? 0,
      night: night ?? 0,
      eve: eve ?? 0,
      morn: morn ?? 0,
    );
  }
}
extension WeatherDetailMapper on WeatherDetailResponse {
  WeatherDetail toDomainModel() {
    return WeatherDetail(
      id: id ?? 0,
      main: main ?? '',
      description: description ?? '',
      icon: icon ?? '',
    );
  }
}
extension AlertMapper on AlertResponse {
  Alert toDomainModel() {
    return Alert(
      senderName: senderName ?? '',
      event: event ?? '',
      start: start ?? 0,
      end: end ?? 0,
      description: description ?? '',
      tags: tags ?? [],
    );
  }
}
