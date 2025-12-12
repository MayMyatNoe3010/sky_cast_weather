import '../../data/models/weather_enums.dart';

class Weather {
  final int id;
  final String main;
  final String description;
  final String icon;
  late WeatherEnums weatherType;


  Weather({
    required this.id,
    required this.main,
    required this.description,
    required this.icon,
  }){
    weatherType = mapWeatherCodeToEnum(main);
  }

  WeatherEnums mapWeatherCodeToEnum(String weatherMain) {

    final code = weatherMain.toLowerCase();

    if (code.contains('clear')) {
      return WeatherEnums.sunny;
    }

    if (code.contains('snow')) {
      return WeatherEnums.snow;
    }
    if (code.contains('rain')) {
      return WeatherEnums.rainy;
    }
    if (code.contains('thunder') ) {
      return WeatherEnums.thunder;
    }
    if (code.contains('fog') || code.contains('mist') || code.contains('haze') || code.contains('clouds')) {
      return WeatherEnums.foggy;
    }
    if (code.contains('squall')) {
      return WeatherEnums.windy;
    }

    return WeatherEnums.sunny;
  }
}
