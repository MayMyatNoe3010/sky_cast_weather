import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sky_cast_weather/core/extensions/date_extension.dart';
import 'package:sky_cast_weather/core/extensions/kelvin_temperature_extension.dart';
import 'package:sky_cast_weather/core/extensions/string_extension.dart';
import 'package:sky_cast_weather/features/weather/domain/entities/forecast_item.dart';

class WeatherListItemWidget extends StatelessWidget {
  final ForecastItem weather;

  WeatherListItemWidget({super.key, required this.weather});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: CachedNetworkImage(
            imageUrl: weather?.weather.first.icon.getWeatherIcon() ?? '',
            width: 40,
            height: 40,
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),

          title: Text('${weather?.main.temp.toCelsiusString(0)}'),
          subtitle: Text('${weather?.weather.first.description}'),

          trailing: Text(
            DateTime.parse(weather?.dateText ?? '').getWithoutTimeString(),
          ),
        ),
        const Divider(height: 1),
      ],
    );
  }
}
