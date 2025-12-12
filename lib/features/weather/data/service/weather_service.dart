import 'dart:convert';

import 'package:sky_cast_weather/core/services/dio_client.dart';
import 'package:sky_cast_weather/core/services/geo_location_service.dart';
import 'package:sky_cast_weather/core/utils/api_costants.dart';
import 'package:sky_cast_weather/core/utils/constants.dart';
import 'package:sky_cast_weather/features/weather/data/mappers/weather_mapper.dart';
import 'package:sky_cast_weather/features/weather/data/models/forecast_response.dart';
import 'package:sky_cast_weather/features/weather/data/models/weather_response.dart';
import 'package:sky_cast_weather/features/weather/domain/entities/forecast.dart';

import '../../../../core/extensions/date_extension.dart';
import '../../domain/entities/weather.dart';
typedef LatLong = ({double lat, double lon});

class WeatherService{
  final DioClient dioClient;
  WeatherService(this.dioClient);
  Future<LatLong> getCityCoordinates(String city) async {
    final response = await dioClient.get(
      APIConstants.geoLocation,
      queryParams: {
        'q': city,
        'limit': 1,
        'appid': Constants.OPENWEATHER_APIKEY,
      },
    );

    if ((response.data as List).isEmpty) {
      throw Exception('City not found');
    }

    final data = response.data[0];
    return toLatLon((data['lat'] as num).toDouble(), (data['lon'] as num).toDouble());
  }

  Future<Forecast> getWeathers([String? city]) async {
    LatLong cityPosition = (lat: 0, lon: 0);
    if(city == null || city == ''){
      final position = await GeoLocationService.determinePosition();
      cityPosition = toLatLon(position.latitude, position.longitude);//{'lat': position.latitude, 'lon' : position.longitude};
    }else{
      cityPosition = await getCityCoordinates(city);
    }
    print('CityPosition: $cityPosition');

    final queryParams = {
      'lat': cityPosition.lat,
      'lon': cityPosition.lon,
      'cnt': 7,
      'appid': Constants.OPENWEATHER_APIKEY,
    };
    final response = await dioClient.get(APIConstants.getForecast, queryParams: queryParams);
    print('Response: $response');
    return ForecastResponse.fromJson((jsonDecode(response.toString()))).toDomain();
  }
  LatLong toLatLon(double lat, double long){
    return (lat: lat, lon: long);
  }
}