import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:sky_cast_weather/core/extensions/kelvin_temperature_extension.dart';
import 'package:sky_cast_weather/features/weather/domain/entities/forecast_item.dart';

import '../../../../../core/res/dimensions.dart';
import '../../../../../core/utils/app_routes.dart';
import '../../../domain/entities/forecast.dart';

class CurrentWeatherHeaderWidget extends StatelessWidget {
  final Forecast weather;
  final String lottiePath;

  const CurrentWeatherHeaderWidget({
    required this.weather,
    required this.lottiePath,
  });

  @override
  Widget build(BuildContext context) {
    final lottieWidgetSize = MediaQuery.of(context).size.width * 0.6;
    final double expandedHeaderHeight =
        MediaQuery.of(context).size.height * 0.6;
    final firstItem = weather.items.first;

    return SliverAppBar(
      pinned: true,
      expandedHeight: expandedHeaderHeight,

      flexibleSpace: LayoutBuilder(
        builder: (context, constraints) {
          final double currentHeight = constraints.maxHeight;
          final double collapsedHeight =
              kToolbarHeight + MediaQuery.of(context).padding.top;

          final double collapseRatio =
              (expandedHeaderHeight - currentHeight) /
              (expandedHeaderHeight - collapsedHeight);

          final double opacity = ((collapseRatio - 0.7) / 0.3).clamp(0.0, 1.0);
          return FlexibleSpaceBar(
            collapseMode: CollapseMode.parallax,
            title: Opacity(
              opacity: opacity,
              child: Row(
                children: [
                  Text(
                    weather?.city.name ?? '',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                  SizedBox(width: Dimensions.paddingM),
                  Text(
                    '${firstItem?.main.temp.toCelsiusString(0)}',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ],
              ),
            ),
            titlePadding: EdgeInsets.all(Dimensions.paddingS),
            background: Padding(
              padding: EdgeInsets.only(
                top: kToolbarHeight + Dimensions.paddingM,
                bottom: Dimensions.paddingM,
              ),
              child: Column(
                children: [
                  Text(
                    weather?.city.name ?? '',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.5,
                    ),
                  ),
                  SizedBox(height: Dimensions.paddingM),
                  Text(
                    '${firstItem?.main.temp.toCelsiusString(0)}',
                    style: Theme.of(context).textTheme.displayLarge?.copyWith(
                      fontSize: 80,
                      fontWeight: FontWeight.w300,
                      height: 1.0,
                    ),
                  ),
                  SizedBox(
                    width: lottieWidgetSize,
                    height: lottieWidgetSize,
                    child: Lottie.asset(lottiePath),
                  ),

                  Text(
                    '${firstItem?.weather.first.description}',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                  SizedBox(height: Dimensions.paddingM),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'H ${firstItem?.main.maxTemp.toCelsiusString()}',
                        style: Theme.of(context).textTheme.titleMedium
                            ?.copyWith(fontWeight: FontWeight.normal),
                      ),
                      SizedBox(width: Dimensions.paddingM),
                      Text(
                        'L ${firstItem?.main.minTemp.toCelsiusString()}',
                        style: Theme.of(context).textTheme.titleMedium
                            ?.copyWith(
                              color: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.color
                                  ?.withValues(alpha: 0.7),
                              fontWeight: FontWeight.normal,
                            ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
      actions: [
        IconButton(
          onPressed: () {
            Navigator.pushNamed(context, AppRoutes.search);
          },
          icon: Icon(Icons.search),
        ),
      ],
    );
  }
}
