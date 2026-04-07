import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sky_cast_weather/features/weather/data/service/weather_service.dart';
import 'package:sky_cast_weather/features/weather/domain/entities/city.dart';
import 'package:sky_cast_weather/features/weather/domain/entities/clouds.dart';
import 'package:sky_cast_weather/features/weather/domain/entities/coord.dart';
import 'package:sky_cast_weather/features/weather/domain/entities/forecast.dart';
import 'package:sky_cast_weather/features/weather/domain/entities/forecast_item.dart';
import 'package:sky_cast_weather/features/weather/domain/entities/main_details.dart';
import 'package:sky_cast_weather/features/weather/domain/entities/weather.dart';
import 'package:sky_cast_weather/features/weather/domain/entities/wind.dart';
import 'package:sky_cast_weather/features/weather/presentation/providers/today_provider.dart';
import 'package:sky_cast_weather/features/weather/presentation/providers/weather_provider.dart';

class _FakeWeatherService implements IWeatherService {
  final Forecast forecast;
  _FakeWeatherService(this.forecast);

  @override
  Future<Forecast> getTodayWeatherDetail([String? city]) async => forecast;

  @override
  Future<LatLong> getCityCoordinates(String city) {
    // TODO: implement getCityCoordinates
    throw UnimplementedError();
  }
}

Forecast _forecastWithItems(List<ForecastItem> items) {
  return Forecast(
    count: items.length,
    items: items,
    city: City(
      id: 1,
      name: 'Test City',
      coord: Coord(lat: 0, lon: 0),
      country: 'TC',
      timezone: 0,
    ),
  );
}

ForecastItem _itemAt(DateTime dt) {
  return ForecastItem(
    timestamp: dt.millisecondsSinceEpoch ~/ 1000,
    main: MainDetails(
      temp: 300,
      feelsLike: 300,
      minTemp: 300,
      maxTemp: 300,
      pressure: 1000,
      humidity: 50,
    ),
    weather: [
      Weather(id: 1, main: 'Clear', description: 'clear', icon: '01d'),
    ],
    clouds: Clouds(cloudiness: 0),
    wind: Wind(speed: 1, degree: 0),
    visibility: 10000,
    pop: 0,
    dateText: dt.toIso8601String(),
  );
}

void main() {
  test('todayProvider returns only items for today', () async {
    final now = DateTime.now();
    final todayMorning = DateTime(now.year, now.month, now.day, 9);
    final todayNoon = DateTime(now.year, now.month, now.day, 12);
    final tomorrow = DateTime(now.year, now.month, now.day + 1, 12);

    final forecast = _forecastWithItems([
      _itemAt(todayMorning),
      _itemAt(todayNoon),
      _itemAt(tomorrow),
    ]);

    final container = ProviderContainer(
      overrides: [
        weatherServiceProvider.overrideWithValue(_FakeWeatherService(forecast)),
      ],
    );
    addTearDown(container.dispose);

    await container.read(weatherProvider.future);

    final todayAsync = container.read(todayProvider);
    expect(todayAsync.hasValue, true);
    expect(todayAsync.value!.length, 2);
  });
}

