import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sky_cast_weather/core/extensions/kelvin_temperature_extension.dart';
import 'package:sky_cast_weather/features/weather/domain/entities/forecast_item.dart';
import 'package:sky_cast_weather/features/weather/presentation/ui/component/weather_column_item_widget.dart';

import '../../../../../core/res/dimensions.dart';
import '../../providers/today_provider.dart';
import 'card_inside_title_widget.dart';

class WeatherDetailCardWidget extends ConsumerWidget {
  ForecastItem forecastItem;
  WeatherDetailCardWidget({super.key, required this.forecastItem});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todayValue = ref.watch(todayProvider);
    return Card.outlined(
      child: Padding(
        padding: EdgeInsets.all(Dimensions.paddingS),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CardInsideTitleWidget(
                  content: '${forecastItem?.main.feelsLike.toCelsiusString(0)}',
                  title: 'Feels Like',
                ),
                CardInsideTitleWidget(
                  title: 'Humidity',
                  content: '${forecastItem?.main.humidity}',
                ),
                CardInsideTitleWidget(
                  title: 'Pressure',
                  content: '${forecastItem?.main.pressure}',
                ),
              ],
            ),

            Divider(
              color: Theme.of(context).colorScheme.outlineVariant,
              height: Dimensions.paddingS,
            ),

            todayValue.when(
              data: (items) {
                return SizedBox(
                  height: 120,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: items.length ?? 0,
                    itemBuilder: (_, index) {
                      final weather = items[index];
                      return WeatherColumnItemWidget(weather: weather);
                    },
                  ),
                );
              },
              error: (e, _) => const SizedBox.shrink(),
              loading: () => const Center(child: CircularProgressIndicator()),
            ),
          ],
        ),
      ),
    );
  }
}
