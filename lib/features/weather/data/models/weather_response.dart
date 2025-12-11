import 'package:freezed_annotation/freezed_annotation.dart';
part 'weather_data.freezed.dart';
part 'weather_data.g.dart';

@freezed
class WeatherResponse with _$WeatherResponse {
  const factory WeatherResponse({
    required double lat,
    required double lon,
    required String timezone,
    @JsonKey(name: 'timezone_offset') required int timezoneOffset,
    required CurrentWeather current,
    required List<Minutely> minutely,
    required List<Hourly> hourly,
    required List<Daily> daily,
    List<Alert>? alerts,
  }) = _WeatherResponse;

  factory WeatherResponse.fromJson(Map<String, dynamic> json) =>
      _$WeatherResponseFromJson(json);
}
@freezed
class CurrentWeather with _$CurrentWeather {
  const factory CurrentWeather({
    required int dt,
    required int sunrise,
    required int sunset,
    required double temp,
    @JsonKey(name: 'feels_like') required double feelsLike,
    required int pressure,
    required int humidity,
    @JsonKey(name: 'dew_point') required double dewPoint,
    required double uvi,
    required int clouds,
    required int visibility,
    @JsonKey(name: 'wind_speed') required double windSpeed,
    @JsonKey(name: 'wind_deg') required int windDeg,
    @JsonKey(name: 'wind_gust') double? windGust, // Added as optional
    required List<WeatherDetail> weather,
  }) = _CurrentWeather;

  factory CurrentWeather.fromJson(Map<String, dynamic> json) =>
      _$CurrentWeatherFromJson(json);
}
@freezed
class Minutely with _$Minutely {
  const factory Minutely({required int dt, required double precipitation}) =
      _Minutely;

  factory Minutely.fromJson(Map<String, dynamic> json) =>
      _$MinutelyFromJson(json);
}
@freezed
class Hourly with _$Hourly {
  const factory Hourly({
    required int dt,
    required double temp,
    @JsonKey(name: 'feels_like') required double feelsLike,
    required int pressure,
    required int humidity,
    @JsonKey(name: 'dew_point') required double dewPoint,
    required double uvi,
    required int clouds,
    required int visibility,
    @JsonKey(name: 'wind_speed') required double windSpeed,
    @JsonKey(name: 'wind_deg') required int windDeg,
    @JsonKey(name: 'wind_gust') double? windGust,
    required List<WeatherDetail> weather,
    required double pop, // Probability of Precipitation
  }) = _Hourly;

  factory Hourly.fromJson(Map<String, dynamic> json) => _$HourlyFromJson(json);
}
@freezed
class Daily with _$Daily {
  const factory Daily({
    required int dt,
    required int sunrise,
    required int sunset,
    required int moonrise,
    required int moonset,
    @JsonKey(name: 'moon_phase') required double moonPhase,
    required String summary,
    required Temperature temp,
    @JsonKey(name: 'feels_like') required FeelsLike feelsLike,
    required int pressure,
    required int humidity,
    @JsonKey(name: 'dew_point') required double dewPoint,
    @JsonKey(name: 'wind_speed') required double windSpeed,
    @JsonKey(name: 'wind_deg') required int windDeg,
    @JsonKey(name: 'wind_gust') double? windGust,
    required List<WeatherDetail> weather,
    required int clouds,
    required double pop,
    double? rain, // Rain is optional/nullable
    required double uvi,
  }) = _Daily;

  factory Daily.fromJson(Map<String, dynamic> json) => _$DailyFromJson(json);
}
@freezed
class Temperature with _$Temperature {
  const factory Temperature({
    required double day,
    required double min,
    required double max,
    required double night,
    required double eve,
    required double morn,
  }) = _Temperature;

  factory Temperature.fromJson(Map<String, dynamic> json) =>
      _$TemperatureFromJson(json);
}
@freezed
class FeelsLike with _$FeelsLike {
  const factory FeelsLike({
    required double day,
    required double night,
    required double eve,
    required double morn,
  }) = _FeelsLike;

  factory FeelsLike.fromJson(Map<String, dynamic> json) =>
      _$FeelsLikeFromJson(json);
}
@freezed
class WeatherDetail with _$WeatherDetail {
  const factory WeatherDetail({
    required int id,
    required String main,
    required String description,
    required String icon,
  }) = _WeatherDetail;

  factory WeatherDetail.fromJson(Map<String, dynamic> json) =>
      _$WeatherDetailFromJson(json);
}
@freezed
class Alert with _$Alert {
  const factory Alert({
    @JsonKey(name: 'sender_name') required String senderName,
    required String event,
    required int start,
    required int end,
    required String description,
    required List<String> tags,
  }) = _Alert;

  factory Alert.fromJson(Map<String, dynamic> json) => _$AlertFromJson(json);
}