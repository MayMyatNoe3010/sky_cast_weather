import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sky_cast_weather/features/weather/presentation/ui/page/city_selection_sceen.dart';
import 'package:sky_cast_weather/features/weather/presentation/ui/page/current_weather_screen.dart';

import 'core/utils/app_routes.dart';

void main() {
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SkyCastWeather',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
      ),

      initialRoute: AppRoutes.initial,
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case AppRoutes.initial:

            final String city = settings.arguments as String? ?? '';
            return MaterialPageRoute(
              builder: (context) => CurrentWeatherScreen(city: city),
            );

          case AppRoutes.search:
            return MaterialPageRoute(
              builder: (context) => const CitySelectionScreen(),
            );

        }
      },
    );
  }
}

