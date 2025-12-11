import 'package:sky_cast_weather/core/services/dio_client.dart';
import 'package:sky_cast_weather/core/utils/constants.dart';
import 'package:sky_cast_weather/features/weather/data/mappers/weather_mapper.dart';
import 'package:sky_cast_weather/features/weather/data/models/weather_response.dart';

import '../../../../core/extensions/date_extension.dart';
import '../../domain/entities/weather.dart';

class WeatherService{
  final DioClient dioClient;
  WeatherService(this.dioClient);
  Future<Map<String, double>> getCityCoordinates(String city) async {
    final response = await dioClient.get(
      'geo/1.0/direct',
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
    return {
      'lat': (data['lat'] as num).toDouble(),
      'lon': (data['lon'] as num).toDouble(),
    };
  }

  Future<List<Weather>> getWeathers([String? date]) async {

    final response = await dioClient.get('${date ?? DateTime.now().getWithoutTimeString()}');

    return (response.data as List)
        .map((e) => WeatherResponse.fromJson(e).toDomainModel())
        .toList();
  }

}