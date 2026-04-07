import 'package:flutter/material.dart';
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

Forecast _forecastWithOneItem() {
  final dt = DateTime.now();
  return Forecast(
    count: 1,
    items: [
      ForecastItem(
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
      ),
    ],
    city: City(
      id: 1,
      name: 'Test City',
      coord: Coord(lat: 0, lon: 0),
      country: 'TC',
      timezone: 0,
    ),
  );
}

class _WeatherCountWidget extends ConsumerWidget {
  const _WeatherCountWidget();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weather = ref.watch(weatherProvider);
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: weather.when(
            data: (v) => Text('count:${v.count}'),
            loading: () => const Text('loading'),
            error: (e, _) => Text('error:$e'),
          ),
        ),
      ),
    );
  }
}

void main() {
  testWidgets('weatherProvider can be consumed in widgets', (tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          weatherServiceProvider.overrideWithValue(
            _FakeWeatherService(_forecastWithOneItem()),
          ),
        ],
        child: const _WeatherCountWidget(),
      ),
    );

    await tester.pump();
    expect(find.text('count:1'), findsOneWidget);
  });
}
