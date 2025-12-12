import '../../domain/entities/city.dart';
import '../../domain/entities/clouds.dart';
import '../../domain/entities/coord.dart';
import '../../domain/entities/forecast.dart';
import '../../domain/entities/forecast_item.dart';
import '../../domain/entities/main_details.dart';
import '../../domain/entities/weather.dart';
import '../../domain/entities/wind.dart';
import '../models/forecast_response.dart';

extension ForecastMapper on ForecastResponse {
  Forecast toDomain() {
    return Forecast(
      count: cnt,
      items: list.map((e) => e.toDomain()).toList(),
      city: city.toDomain(),
    );
  }
}
extension ForecastItemMapper on ForecastItemResponse {
  ForecastItem toDomain() {
    return ForecastItem(
      timestamp: dt,
      main: main.toDomain(),
      weather: weather.map((e) => e.toDomain()).toList(),
      clouds: clouds.toDomain(),
      wind: wind.toDomain(),
      visibility: visibility,
      pop: pop,
      dateText: dtTxt,
    );
  }
}
extension MainDetailsMapper on MainDetailsResponse {
  MainDetails toDomain() {
    return MainDetails(
      temp: temp,
      feelsLike: feelsLike,
      minTemp: tempMin,
      maxTemp: tempMax,
      pressure: pressure,
      humidity: humidity,
    );
  }
}
extension WeatherMapper on WeatherResponse {
  Weather toDomain() {
    return Weather(
      id: id,
      main: main,
      description: description,
      icon: icon,
    );
  }
}
extension WindMapper on WindResponse {
  Wind toDomain() {
    return Wind(
      speed: speed,
      degree: deg,
    );
  }
}
extension CloudsMapper on CloudsResponse {
  Clouds toDomain() {
    return Clouds(
      cloudiness: all,
    );
  }
}
extension CityMapper on CityResponse {
  City toDomain() {
    return City(
      id: id,
      name: name,
      coord: coord.toDomain(),
      country: country,
      timezone: timezone,
    );
  }
}
extension CoordMapper on CoordResponse {
  Coord toDomain() {
    return Coord(
      lat: lat,
      lon: lon,
    );
  }
}


