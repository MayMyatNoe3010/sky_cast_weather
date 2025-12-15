import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sky_cast_weather/core/extensions/date_extension.dart';
import 'package:sky_cast_weather/core/extensions/kelvin_temperature_extension.dart';
import 'package:sky_cast_weather/core/extensions/string_extension.dart';
import 'package:sky_cast_weather/features/weather/domain/entities/forecast_item.dart';

import '../../../../../core/res/dimensions.dart';

class WeatherColumnItemWidget extends StatelessWidget {
  final ForecastItem weather;

  const WeatherColumnItemWidget({super.key, required this.weather});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingS / 2),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            DateTime.parse(weather?.dateText ?? '').getHourOnlyString(),
            style: Theme.of(context).textTheme.bodyMedium,
          ),

          SizedBox(
            width: 50,
            height: 50,
            child: CachedNetworkImage(
              imageUrl: weather?.weather.first.icon.getWeatherIcon() ?? '',
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),

          Text(
            '${weather?.main.temp.toCelsiusString(0)}',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}
