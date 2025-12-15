import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:sky_cast_weather/core/extensions/date_extension.dart';
import 'package:sky_cast_weather/core/extensions/kelvin_temperature_extension.dart';
import 'package:sky_cast_weather/core/extensions/string_extension.dart';
import 'package:sky_cast_weather/core/res/dimensions.dart';
import 'package:sky_cast_weather/core/utils/app_routes.dart';
import 'package:sky_cast_weather/features/weather/data/models/weather_enums.dart';
import 'package:sky_cast_weather/features/weather/presentation/ui/component/current_weather_header_widget.dart';
import 'package:sky_cast_weather/features/weather/presentation/ui/component/five_days_forecast_widget.dart';
import 'package:sky_cast_weather/features/weather/presentation/ui/component/weather_column_item_widget.dart';
import 'package:sky_cast_weather/features/weather/presentation/ui/component/weather_detail_card_widget.dart';
import 'package:sky_cast_weather/features/weather/presentation/ui/component/weather_list_item_widget.dart';

import '../../providers/five_days_noon_provider.dart';
import '../../providers/today_provider.dart';
import '../../providers/weather_provider.dart';
import '../component/card_inside_title_widget.dart';

class CurrentWeatherScreen extends ConsumerWidget {
  final String city;

  const CurrentWeatherScreen({required this.city, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final double expandedHeaderHeight =
        MediaQuery.of(context).size.height * 0.6;
    final weatherAsync = ref.watch(weatherProvider);
    final weatherValue = weatherAsync.value;
    final firstItem = weatherValue?.items.first;
    final String lottiePath =
        firstItem?.weather.first.weatherType.getLottieByWeatherType() ??
        'assets/lottie/loading.json';

    return Scaffold(
      body: weatherAsync.when(
        data: (data) => CustomScrollView(
          slivers: [
            CurrentWeatherHeaderWidget(weather: data, lottiePath: lottiePath),

            SliverToBoxAdapter(
              child: Container(
                margin: EdgeInsets.all(Dimensions.paddingS),
                child: WeatherDetailCardWidget(forecastItem: data.items.first),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Next 5 Days Forecast',
                  style: Theme.of(
                    context,
                  ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            FiveDaysForecastWidget(),
            FiveDaysForecastWidget(),
          ],
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Error: $e')),
      ),
    );
  }
}
