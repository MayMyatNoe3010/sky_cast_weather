enum WeatherEnums{
  foggy, snow, sunny, thunder, windy, rainy;
}
extension WeatherEnumsExtension on WeatherEnums{
  String getLottieByWeatherType(){
    switch(this){
      case WeatherEnums.foggy:
        return 'assets/lottie/foggy.json';
      case WeatherEnums.snow:
        return 'assets/lottie/snow.json';
      case WeatherEnums.sunny:
        return 'assets/lottie/sunny.json';
      case WeatherEnums.thunder:
        return 'assets/lottie/thunder.json';
      case WeatherEnums.windy:
        return 'assets/lottie/windy.json';
      case WeatherEnums.rainy:
        return 'assets/lottie/storm.json';

    }
  }
}