import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/weather_provider.dart';

class CurrentWeatherScreen extends ConsumerWidget {
  final String city;

  const CurrentWeatherScreen({required this.city, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weatherAsync = ref.watch(weatherProvider);

    return Scaffold(
      appBar: AppBar(title: Text(city)),
      body: weatherAsync.when(
        data: (list) => ListView.builder(
          itemCount: list.length,
          itemBuilder: (_, index) {
            final weather = list[index];
            return ListTile(
              leading: Image.network(
                'http://openweathermap.org/img/wn/${weather.icon}@2x.png',
              ),
              title: Text('${weather.temperature} °C'),
              subtitle: Text(weather.condition),
              trailing: Text('${weather.dateTime.hour}:00'),
            );
          },
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(
          child: Text('Error: $e'),
        ),
      ),
    );
  }
}
