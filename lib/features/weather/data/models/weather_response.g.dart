// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherResponse _$WeatherResponseFromJson(Map<String, dynamic> json) =>
    WeatherResponse(
      lat: (json['lat'] as num?)?.toDouble(),
      lon: (json['lon'] as num?)?.toDouble(),
      timezone: json['timezone'] as String?,
      timezoneOffset: (json['timezone_offset'] as num?)?.toInt(),
      current: json['current'] == null
          ? null
          : CurrentWeatherResponse.fromJson(
              json['current'] as Map<String, dynamic>,
            ),
      minutely: (json['minutely'] as List<dynamic>?)
          ?.map((e) => MinutelyResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      hourly: (json['hourly'] as List<dynamic>?)
          ?.map((e) => HourlyResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      daily: (json['daily'] as List<dynamic>?)
          ?.map((e) => DailyResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      alerts: (json['alerts'] as List<dynamic>?)
          ?.map((e) => AlertResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$WeatherResponseToJson(WeatherResponse instance) =>
    <String, dynamic>{
      'lat': instance.lat,
      'lon': instance.lon,
      'timezone': instance.timezone,
      'timezone_offset': instance.timezoneOffset,
      'current': instance.current?.toJson(),
      'minutely': instance.minutely?.map((e) => e.toJson()).toList(),
      'hourly': instance.hourly?.map((e) => e.toJson()).toList(),
      'daily': instance.daily?.map((e) => e.toJson()).toList(),
      'alerts': instance.alerts?.map((e) => e.toJson()).toList(),
    };

CurrentWeatherResponse _$CurrentWeatherResponseFromJson(
  Map<String, dynamic> json,
) => CurrentWeatherResponse(
  dt: (json['dt'] as num?)?.toInt(),
  sunrise: (json['sunrise'] as num?)?.toInt(),
  sunset: (json['sunset'] as num?)?.toInt(),
  temp: (json['temp'] as num?)?.toDouble(),
  feelsLike: (json['feels_like'] as num?)?.toDouble(),
  pressure: (json['pressure'] as num?)?.toInt(),
  humidity: (json['humidity'] as num?)?.toInt(),
  dewPoint: (json['dew_point'] as num?)?.toDouble(),
  uvi: (json['uvi'] as num?)?.toDouble(),
  clouds: (json['clouds'] as num?)?.toInt(),
  visibility: (json['visibility'] as num?)?.toInt(),
  windSpeed: (json['wind_speed'] as num?)?.toDouble(),
  windDeg: (json['wind_deg'] as num?)?.toInt(),
  windGust: (json['wind_gust'] as num?)?.toDouble(),
  weather: (json['weather'] as List<dynamic>?)
      ?.map((e) => WeatherDetailResponse.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$CurrentWeatherResponseToJson(
  CurrentWeatherResponse instance,
) => <String, dynamic>{
  'dt': instance.dt,
  'sunrise': instance.sunrise,
  'sunset': instance.sunset,
  'temp': instance.temp,
  'feels_like': instance.feelsLike,
  'pressure': instance.pressure,
  'humidity': instance.humidity,
  'dew_point': instance.dewPoint,
  'uvi': instance.uvi,
  'clouds': instance.clouds,
  'visibility': instance.visibility,
  'wind_speed': instance.windSpeed,
  'wind_deg': instance.windDeg,
  'wind_gust': instance.windGust,
  'weather': instance.weather?.map((e) => e.toJson()).toList(),
};

MinutelyResponse _$MinutelyResponseFromJson(Map<String, dynamic> json) =>
    MinutelyResponse(
      dt: (json['dt'] as num?)?.toInt(),
      precipitation: (json['precipitation'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$MinutelyResponseToJson(MinutelyResponse instance) =>
    <String, dynamic>{
      'dt': instance.dt,
      'precipitation': instance.precipitation,
    };

HourlyResponse _$HourlyResponseFromJson(Map<String, dynamic> json) =>
    HourlyResponse(
      dt: (json['dt'] as num?)?.toInt(),
      temp: (json['temp'] as num?)?.toDouble(),
      feelsLike: (json['feels_like'] as num?)?.toDouble(),
      pressure: (json['pressure'] as num?)?.toInt(),
      humidity: (json['humidity'] as num?)?.toInt(),
      dewPoint: (json['dew_point'] as num?)?.toDouble(),
      uvi: (json['uvi'] as num?)?.toDouble(),
      clouds: (json['clouds'] as num?)?.toInt(),
      visibility: (json['visibility'] as num?)?.toInt(),
      windSpeed: (json['wind_speed'] as num?)?.toDouble(),
      windDeg: (json['wind_deg'] as num?)?.toInt(),
      windGust: (json['wind_gust'] as num?)?.toDouble(),
      weather: (json['weather'] as List<dynamic>?)
          ?.map(
            (e) => WeatherDetailResponse.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
      pop: (json['pop'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$HourlyResponseToJson(HourlyResponse instance) =>
    <String, dynamic>{
      'dt': instance.dt,
      'temp': instance.temp,
      'feels_like': instance.feelsLike,
      'pressure': instance.pressure,
      'humidity': instance.humidity,
      'dew_point': instance.dewPoint,
      'uvi': instance.uvi,
      'clouds': instance.clouds,
      'visibility': instance.visibility,
      'wind_speed': instance.windSpeed,
      'wind_deg': instance.windDeg,
      'wind_gust': instance.windGust,
      'weather': instance.weather?.map((e) => e.toJson()).toList(),
      'pop': instance.pop,
    };

DailyResponse _$DailyResponseFromJson(
  Map<String, dynamic> json,
) => DailyResponse(
  dt: (json['dt'] as num?)?.toInt(),
  sunrise: (json['sunrise'] as num?)?.toInt(),
  sunset: (json['sunset'] as num?)?.toInt(),
  moonrise: (json['moonrise'] as num?)?.toInt(),
  moonset: (json['moonset'] as num?)?.toInt(),
  moonPhase: (json['moon_phase'] as num?)?.toDouble(),
  summary: json['summary'] as String?,
  temp: json['temp'] == null
      ? null
      : TemperatureResponse.fromJson(json['temp'] as Map<String, dynamic>),
  feelsLike: json['feels_like'] == null
      ? null
      : FeelsLikeResponse.fromJson(json['feels_like'] as Map<String, dynamic>),
  pressure: (json['pressure'] as num?)?.toInt(),
  humidity: (json['humidity'] as num?)?.toInt(),
  dewPoint: (json['dew_point'] as num?)?.toDouble(),
  windSpeed: (json['wind_speed'] as num?)?.toDouble(),
  windDeg: (json['wind_deg'] as num?)?.toInt(),
  windGust: (json['wind_gust'] as num?)?.toDouble(),
  weather: (json['weather'] as List<dynamic>?)
      ?.map((e) => WeatherDetailResponse.fromJson(e as Map<String, dynamic>))
      .toList(),
  clouds: (json['clouds'] as num?)?.toInt(),
  pop: (json['pop'] as num?)?.toDouble(),
  rain: (json['rain'] as num?)?.toDouble(),
  uvi: (json['uvi'] as num?)?.toDouble(),
);

Map<String, dynamic> _$DailyResponseToJson(DailyResponse instance) =>
    <String, dynamic>{
      'dt': instance.dt,
      'sunrise': instance.sunrise,
      'sunset': instance.sunset,
      'moonrise': instance.moonrise,
      'moonset': instance.moonset,
      'moon_phase': instance.moonPhase,
      'summary': instance.summary,
      'temp': instance.temp?.toJson(),
      'feels_like': instance.feelsLike?.toJson(),
      'pressure': instance.pressure,
      'humidity': instance.humidity,
      'dew_point': instance.dewPoint,
      'wind_speed': instance.windSpeed,
      'wind_deg': instance.windDeg,
      'wind_gust': instance.windGust,
      'weather': instance.weather?.map((e) => e.toJson()).toList(),
      'clouds': instance.clouds,
      'pop': instance.pop,
      'rain': instance.rain,
      'uvi': instance.uvi,
    };

TemperatureResponse _$TemperatureResponseFromJson(Map<String, dynamic> json) =>
    TemperatureResponse(
      day: (json['day'] as num?)?.toDouble(),
      min: (json['min'] as num?)?.toDouble(),
      max: (json['max'] as num?)?.toDouble(),
      night: (json['night'] as num?)?.toDouble(),
      eve: (json['eve'] as num?)?.toDouble(),
      morn: (json['morn'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$TemperatureResponseToJson(
  TemperatureResponse instance,
) => <String, dynamic>{
  'day': instance.day,
  'min': instance.min,
  'max': instance.max,
  'night': instance.night,
  'eve': instance.eve,
  'morn': instance.morn,
};

FeelsLikeResponse _$FeelsLikeResponseFromJson(Map<String, dynamic> json) =>
    FeelsLikeResponse(
      day: (json['day'] as num?)?.toDouble(),
      night: (json['night'] as num?)?.toDouble(),
      eve: (json['eve'] as num?)?.toDouble(),
      morn: (json['morn'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$FeelsLikeResponseToJson(FeelsLikeResponse instance) =>
    <String, dynamic>{
      'day': instance.day,
      'night': instance.night,
      'eve': instance.eve,
      'morn': instance.morn,
    };

WeatherDetailResponse _$WeatherDetailResponseFromJson(
  Map<String, dynamic> json,
) => WeatherDetailResponse(
  id: (json['id'] as num?)?.toInt(),
  main: json['main'] as String?,
  description: json['description'] as String?,
  icon: json['icon'] as String?,
);

Map<String, dynamic> _$WeatherDetailResponseToJson(
  WeatherDetailResponse instance,
) => <String, dynamic>{
  'id': instance.id,
  'main': instance.main,
  'description': instance.description,
  'icon': instance.icon,
};

AlertResponse _$AlertResponseFromJson(Map<String, dynamic> json) =>
    AlertResponse(
      senderName: json['sender_name'] as String?,
      event: json['event'] as String?,
      start: (json['start'] as num?)?.toInt(),
      end: (json['end'] as num?)?.toInt(),
      description: json['description'] as String?,
      tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$AlertResponseToJson(AlertResponse instance) =>
    <String, dynamic>{
      'sender_name': instance.senderName,
      'event': instance.event,
      'start': instance.start,
      'end': instance.end,
      'description': instance.description,
      'tags': instance.tags,
    };
