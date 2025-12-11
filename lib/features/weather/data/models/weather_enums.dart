enum WeatherEnums{
  foggy, snow, sunny, thunder, windy;
}
extension WeatherEnumsExtension on WeatherEnums{
  String getLottieByWeatherType(){
    switch(this){

      case WeatherEnums.foggy:
        return '';
      case WeatherEnums.snow:
        return '';
      case WeatherEnums.sunny:
        return '';
      case WeatherEnums.thunder:
        return '';
      case WeatherEnums.windy:
        return '';
    }
  }
}