// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forecast_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ForecastResponse _$ForecastResponseFromJson(Map<String, dynamic> json) =>
    ForecastResponse(
      cnt: (json['cnt'] as num).toInt(),
      list: (json['list'] as List<dynamic>)
          .map((e) => ForecastItemResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      city: CityResponse.fromJson(json['city'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ForecastResponseToJson(ForecastResponse instance) =>
    <String, dynamic>{
      'cnt': instance.cnt,
      'list': instance.list.map((e) => e.toJson()).toList(),
      'city': instance.city.toJson(),
    };

ForecastItemResponse _$ForecastItemResponseFromJson(
  Map<String, dynamic> json,
) => ForecastItemResponse(
  dt: (json['dt'] as num).toInt(),
  main: MainDetailsResponse.fromJson(json['main'] as Map<String, dynamic>),
  weather: (json['weather'] as List<dynamic>)
      .map((e) => WeatherResponse.fromJson(e as Map<String, dynamic>))
      .toList(),
  clouds: CloudsResponse.fromJson(json['clouds'] as Map<String, dynamic>),
  wind: WindResponse.fromJson(json['wind'] as Map<String, dynamic>),
  visibility: (json['visibility'] as num).toInt(),
  pop: (json['pop'] as num).toDouble(),
  dtTxt: json['dt_txt'] as String,
);

Map<String, dynamic> _$ForecastItemResponseToJson(
  ForecastItemResponse instance,
) => <String, dynamic>{
  'dt': instance.dt,
  'main': instance.main,
  'weather': instance.weather,
  'clouds': instance.clouds,
  'wind': instance.wind,
  'visibility': instance.visibility,
  'pop': instance.pop,
  'dt_txt': instance.dtTxt,
};

MainDetailsResponse _$MainDetailsResponseFromJson(Map<String, dynamic> json) =>
    MainDetailsResponse(
      temp: (json['temp'] as num).toDouble(),
      feelsLike: (json['feels_like'] as num).toDouble(),
      tempMin: (json['temp_min'] as num).toDouble(),
      tempMax: (json['temp_max'] as num).toDouble(),
      pressure: (json['pressure'] as num).toInt(),
      humidity: (json['humidity'] as num).toInt(),
    );

Map<String, dynamic> _$MainDetailsResponseToJson(
  MainDetailsResponse instance,
) => <String, dynamic>{
  'temp': instance.temp,
  'feels_like': instance.feelsLike,
  'temp_min': instance.tempMin,
  'temp_max': instance.tempMax,
  'pressure': instance.pressure,
  'humidity': instance.humidity,
};

WeatherResponse _$WeatherResponseFromJson(Map<String, dynamic> json) =>
    WeatherResponse(
      id: (json['id'] as num).toInt(),
      main: json['main'] as String,
      description: json['description'] as String,
      icon: json['icon'] as String,
    );

Map<String, dynamic> _$WeatherResponseToJson(WeatherResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'main': instance.main,
      'description': instance.description,
      'icon': instance.icon,
    };

WindResponse _$WindResponseFromJson(Map<String, dynamic> json) => WindResponse(
  speed: (json['speed'] as num).toDouble(),
  deg: (json['deg'] as num).toInt(),
);

Map<String, dynamic> _$WindResponseToJson(WindResponse instance) =>
    <String, dynamic>{'speed': instance.speed, 'deg': instance.deg};

CloudsResponse _$CloudsResponseFromJson(Map<String, dynamic> json) =>
    CloudsResponse(all: (json['all'] as num).toInt());

Map<String, dynamic> _$CloudsResponseToJson(CloudsResponse instance) =>
    <String, dynamic>{'all': instance.all};

CityResponse _$CityResponseFromJson(Map<String, dynamic> json) => CityResponse(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  coord: CoordResponse.fromJson(json['coord'] as Map<String, dynamic>),
  country: json['country'] as String,
  timezone: (json['timezone'] as num).toInt(),
);

Map<String, dynamic> _$CityResponseToJson(CityResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'coord': instance.coord,
      'country': instance.country,
      'timezone': instance.timezone,
    };

CoordResponse _$CoordResponseFromJson(Map<String, dynamic> json) =>
    CoordResponse(
      lat: (json['lat'] as num).toDouble(),
      lon: (json['lon'] as num).toDouble(),
    );

Map<String, dynamic> _$CoordResponseToJson(CoordResponse instance) =>
    <String, dynamic>{'lat': instance.lat, 'lon': instance.lon};
