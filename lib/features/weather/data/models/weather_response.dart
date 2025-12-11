import 'package:json_annotation/json_annotation.dart';

part 'weather_response.g.dart';

@JsonSerializable(explicitToJson: true)
class WeatherResponse {
  final double? lat;
  final double? lon;
  final String? timezone;

  @JsonKey(name: 'timezone_offset')
  final int? timezoneOffset;

  final CurrentWeatherResponse? current;
  final List<MinutelyResponse>? minutely;
  final List<HourlyResponse>? hourly;
  final List<DailyResponse>? daily;
  final List<AlertResponse>? alerts;

  WeatherResponse({
    this.lat,
    this.lon,
    this.timezone,
    this.timezoneOffset,
    this.current,
    this.minutely,
    this.hourly,
    this.daily,
    this.alerts,
  });

  factory WeatherResponse.fromJson(Map<String, dynamic> json) =>
      _$WeatherResponseFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherResponseToJson(this);
}
@JsonSerializable(explicitToJson: true)
class CurrentWeatherResponse {
  final int? dt;
  final int? sunrise;
  final int? sunset;
  final double? temp;

  @JsonKey(name: 'feels_like')
  final double? feelsLike;

  final int? pressure;
  final int? humidity;

  @JsonKey(name: 'dew_point')
  final double? dewPoint;

  final double? uvi;
  final int? clouds;
  final int? visibility;

  @JsonKey(name: 'wind_speed')
  final double? windSpeed;

  @JsonKey(name: 'wind_deg')
  final int? windDeg;

  @JsonKey(name: 'wind_gust')
  final double? windGust;

  final List<WeatherDetailResponse>? weather;

  CurrentWeatherResponse({
    this.dt,
    this.sunrise,
    this.sunset,
    this.temp,
    this.feelsLike,
    this.pressure,
    this.humidity,
    this.dewPoint,
    this.uvi,
    this.clouds,
    this.visibility,
    this.windSpeed,
    this.windDeg,
    this.windGust,
    this.weather,
  });

  factory CurrentWeatherResponse.fromJson(Map<String, dynamic> json) =>
      _$CurrentWeatherResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CurrentWeatherResponseToJson(this);
}
@JsonSerializable()
class MinutelyResponse {
  final int? dt;
  final double? precipitation;

  MinutelyResponse({this.dt, this.precipitation});

  factory MinutelyResponse.fromJson(Map<String, dynamic> json) =>
      _$MinutelyResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MinutelyResponseToJson(this);
}
@JsonSerializable(explicitToJson: true)
class HourlyResponse {
  final int? dt;
  final double? temp;

  @JsonKey(name: 'feels_like')
  final double? feelsLike;

  final int? pressure;
  final int? humidity;

  @JsonKey(name: 'dew_point')
  final double? dewPoint;

  final double? uvi;
  final int? clouds;
  final int? visibility;

  @JsonKey(name: 'wind_speed')
  final double? windSpeed;

  @JsonKey(name: 'wind_deg')
  final int? windDeg;

  @JsonKey(name: 'wind_gust')
  final double? windGust;

  final List<WeatherDetailResponse>? weather;
  final double? pop;

  HourlyResponse({
    this.dt,
    this.temp,
    this.feelsLike,
    this.pressure,
    this.humidity,
    this.dewPoint,
    this.uvi,
    this.clouds,
    this.visibility,
    this.windSpeed,
    this.windDeg,
    this.windGust,
    this.weather,
    this.pop,
  });

  factory HourlyResponse.fromJson(Map<String, dynamic> json) =>
      _$HourlyResponseFromJson(json);

  Map<String, dynamic> toJson() => _$HourlyResponseToJson(this);
}
@JsonSerializable(explicitToJson: true)
class DailyResponse {
  final int? dt;
  final int? sunrise;
  final int? sunset;
  final int? moonrise;
  final int? moonset;

  @JsonKey(name: 'moon_phase')
  final double? moonPhase;

  final String? summary;
  final TemperatureResponse? temp;

  @JsonKey(name: 'feels_like')
  final FeelsLikeResponse? feelsLike;

  final int? pressure;
  final int? humidity;

  @JsonKey(name: 'dew_point')
  final double? dewPoint;

  @JsonKey(name: 'wind_speed')
  final double? windSpeed;

  @JsonKey(name: 'wind_deg')
  final int? windDeg;

  @JsonKey(name: 'wind_gust')
  final double? windGust;

  final List<WeatherDetailResponse>? weather;
  final int? clouds;
  final double? pop;
  final double? rain;
  final double? uvi;

  DailyResponse({
    this.dt,
    this.sunrise,
    this.sunset,
    this.moonrise,
    this.moonset,
    this.moonPhase,
    this.summary,
    this.temp,
    this.feelsLike,
    this.pressure,
    this.humidity,
    this.dewPoint,
    this.windSpeed,
    this.windDeg,
    this.windGust,
    this.weather,
    this.clouds,
    this.pop,
    this.rain,
    this.uvi,
  });

  factory DailyResponse.fromJson(Map<String, dynamic> json) =>
      _$DailyResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DailyResponseToJson(this);
}
@JsonSerializable()
class TemperatureResponse {
  final double? day;
  final double? min;
  final double? max;
  final double? night;
  final double? eve;
  final double? morn;

  TemperatureResponse({
    this.day,
    this.min,
    this.max,
    this.night,
    this.eve,
    this.morn,
  });

  factory TemperatureResponse.fromJson(Map<String, dynamic> json) =>
      _$TemperatureResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TemperatureResponseToJson(this);
}
@JsonSerializable()
class FeelsLikeResponse {
  final double? day;
  final double? night;
  final double? eve;
  final double? morn;

  FeelsLikeResponse({
    this.day,
    this.night,
    this.eve,
    this.morn,
  });

  factory FeelsLikeResponse.fromJson(Map<String, dynamic> json) =>
      _$FeelsLikeResponseFromJson(json);

  Map<String, dynamic> toJson() => _$FeelsLikeResponseToJson(this);
}
@JsonSerializable()
class WeatherDetailResponse {
  final int? id;
  final String? main;
  final String? description;
  final String? icon;

  WeatherDetailResponse({
    this.id,
    this.main,
    this.description,
    this.icon,
  });

  factory WeatherDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$WeatherDetailResponseFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherDetailResponseToJson(this);
}
@JsonSerializable()
class AlertResponse {
  @JsonKey(name: 'sender_name')
  final String? senderName;

  final String? event;
  final int? start;
  final int? end;
  final String? description;
  final List<String>? tags;

  AlertResponse({
    this.senderName,
    this.event,
    this.start,
    this.end,
    this.description,
    this.tags,
  });

  factory AlertResponse.fromJson(Map<String, dynamic> json) =>
      _$AlertResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AlertResponseToJson(this);
}
