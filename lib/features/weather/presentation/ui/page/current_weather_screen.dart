import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:sky_cast_weather/core/extensions/kelvin_temperature_extension.dart';
import 'package:sky_cast_weather/core/res/dimensions.dart';
import 'package:sky_cast_weather/core/utils/app_routes.dart';
import 'package:sky_cast_weather/features/weather/data/models/weather_enums.dart';

import '../../providers/weather_provider.dart';

class CurrentWeatherScreen extends ConsumerWidget {
  final String city;

  const CurrentWeatherScreen({required this.city, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weatherAsync = ref.watch(weatherProvider);
    final firstItem = weatherAsync.value?.first;
    final String lottiePath = firstItem?.weather.first.weatherType.getLottieByWeatherType() ?? 'assets/lottie/loading.json';
    return Scaffold(
      appBar: AppBar(title: Text(city), actions: [
        IconButton(onPressed: (){
          Navigator.pushNamed(context, AppRoutes.search);
        }, icon: Icon(Icons.search))
      ],),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Card(child: Container(
              padding: EdgeInsets.all(Dimensions.paddingM),
              child: Column(
                children: [
                  Lottie.asset(lottiePath),
                  Text('Feels Like: ${firstItem?.main.feelsLike.toCelsiusString}')
                ],
              ),
            )),
            weatherAsync.when(
              data: (list) => ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: list.length,
                itemBuilder: (_, index) {
                  final weather = list[index];
                  return ListTile(
                    leading: Image.network(
                      'http://openweathermap.org/img/wn/${weather.weather.first.icon}@2x.png',
                    ),
                    title: Text('${weather.main.temp} °C'),
                    subtitle: Text(weather.weather.first.description),
                    trailing: Text('${weather.dateText}:00'),
                  );
                }, separatorBuilder: (BuildContext context, int index) { return Divider(); },
              ),
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (e, _) => Center(
                child: Text('Error: $e'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
