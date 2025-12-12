import 'package:json_annotation/json_annotation.dart';
import 'package:sky_cast_weather/features/weather/data/models/weather_response.dart';

part 'forecast_response.g.dart';

@JsonSerializable(explicitToJson: true)
class ForecastResponse {
  final int cnt;
  final List<ForecastItemResponse> list;
  final CityResponse city;

  ForecastResponse({required this.cnt, required this.list, required this.city});

  factory ForecastResponse.fromJson(Map<String, dynamic> json) =>
      _$ForecastResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ForecastResponseToJson(this);

}
@JsonSerializable()
class ForecastItemResponse {
  final int dt;
  final MainDetailsResponse main;
  final List<WeatherResponse> weather;
  final CloudsResponse clouds;
  final WindResponse wind;
  final int visibility;

  // Note: 'pop' (Probability of Precipitation) is final double
  final double pop;

  // Use @JsonKey to map 'dt_txt' (snake_case) to 'dtTxt' (camelCase)
  @JsonKey(name: 'dt_txt')
  final String dtTxt;

  ForecastItemResponse({
    required this.dt,
    required this.main,
    required this.weather,
    required this.clouds,
    required this.wind,
    required this.visibility,
    required this.pop,
    required this.dtTxt,
  });

  factory ForecastItemResponse.fromJson(Map<String, dynamic> json) =>
      _$ForecastItemResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ForecastItemResponseToJson(this);
}
@JsonSerializable()
class MainDetailsResponse {
  final double temp;

  @JsonKey(name: 'feels_like')
  final double feelsLike;

  @JsonKey(name: 'temp_min')
  final double tempMin;

  @JsonKey(name: 'temp_max')
  final double tempMax;

  final int pressure;
  final int humidity;

  MainDetailsResponse({
    required this.temp,
    required this.feelsLike,
    required this.tempMin,
    required this.tempMax,
    required this.pressure,
    required this.humidity,
  });

  factory MainDetailsResponse.fromJson(Map<String, dynamic> json) =>
      _$MainDetailsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MainDetailsResponseToJson(this);
}

@JsonSerializable()
class WeatherResponse {
  final int id;
  final String main;
  final String description;
  final String icon;

  WeatherResponse({
    required this.id,
    required this.main,
    required this.description,
    required this.icon,
  });

  factory WeatherResponse.fromJson(Map<String, dynamic> json) =>
      _$WeatherResponseFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherResponseToJson(this);
}

@JsonSerializable()
class WindResponse {
  final double speed;
  final int deg;

  WindResponse({required this.speed, required this.deg});

  factory WindResponse.fromJson(Map<String, dynamic> json) => _$WindResponseFromJson(json);

  Map<String, dynamic> toJson() => _$WindResponseToJson(this);
}

@JsonSerializable()
class CloudsResponse {
  final int all;

  CloudsResponse({required this.all});

  factory CloudsResponse.fromJson(Map<String, dynamic> json) => _$CloudsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CloudsResponseToJson(this);
}

@JsonSerializable()
class CityResponse {
  final int id;
  final String name;
  final CoordResponse coord;
  final String country;
  final int timezone;

  CityResponse({
    required this.id,
    required this.name,
    required this.coord,
    required this.country,
    required this.timezone,
  });

  factory CityResponse.fromJson(Map<String, dynamic> json) => _$CityResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CityResponseToJson(this);
}

@JsonSerializable()
class CoordResponse {
  final double lat;
  final double lon;

  CoordResponse({required this.lat, required this.lon});

  factory CoordResponse.fromJson(Map<String, dynamic> json) => _$CoordResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CoordResponseToJson(this);
}
