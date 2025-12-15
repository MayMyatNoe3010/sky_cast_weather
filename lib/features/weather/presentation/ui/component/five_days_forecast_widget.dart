import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sky_cast_weather/features/weather/presentation/providers/five_days_noon_provider.dart';
import 'package:sky_cast_weather/features/weather/presentation/ui/component/weather_list_item_widget.dart';

import '../../../domain/entities/forecast_item.dart';

class FiveDaysForecastWidget extends ConsumerWidget {
  const FiveDaysForecastWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final fiveDaysValue = ref.watch(fiveDaysNoonProvider);
    return fiveDaysValue.when(
      data: (items) {
        return SliverList.builder(
          itemCount: items.length,
          itemBuilder: (_, index) {
            final weather = items[index];
            return WeatherListItemWidget(weather: weather);
          },
        );
      },
      error: (e, _) => Container(),
      loading: () => Container(),
    );
  }
}
