extension StringExtension on String?{
  String getWeatherIcon(){
    return 'http://openweathermap.org/img/wn/$this@2x.png';
  }
}