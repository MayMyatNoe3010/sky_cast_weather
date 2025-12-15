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

import '../../providers/five_days_noon_provider.dart';
import '../../providers/today_provider.dart';
import '../../providers/weather_provider.dart';
import '../component/card_inside_title_widget.dart';

class CurrentWeatherScreen extends ConsumerWidget {
  final String city;

  const CurrentWeatherScreen({required this.city, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lottieWidgetSize = MediaQuery.of(context).size.width * 0.6;
    final double expandedHeaderHeight =
        MediaQuery.of(context).size.height * 0.6;
    final weatherAsync = ref.watch(weatherProvider);
    final weatherValue = weatherAsync.value;
    final fiveDaysValue = ref.watch(fiveDaysNoonProvider);
    final todayValue = ref.watch(todayProvider);
    final firstItem = weatherValue?.items.first;
    final String lottiePath =
        firstItem?.weather.first.weatherType.getLottieByWeatherType() ??
        'assets/lottie/loading.json';

    return Scaffold(
      body: weatherAsync.when(
        data: (data) => CustomScrollView(
          slivers: [
            SliverAppBar(
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

                  final double opacity = ((collapseRatio - 0.8) / 0.2).clamp(
                    0.0,
                    1.0,
                  );
                  return FlexibleSpaceBar(
                    collapseMode: CollapseMode.parallax,
                    title: Opacity(
                      opacity: opacity,
                      child: Row(
                        children: [
                          Text(
                            weatherValue?.city.name ?? '',
                            style: Theme.of(context).textTheme.headlineSmall
                                ?.copyWith(
                                  fontWeight: FontWeight.w500,
                                  color: Theme.of(
                                    context,
                                  ).colorScheme.secondary,
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
                            weatherValue?.city.name ?? '',
                            style: Theme.of(context).textTheme.headlineMedium
                                ?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 0.5,
                                ),
                          ),
                          SizedBox(height: Dimensions.paddingM),
                          Text(
                            '${firstItem?.main.temp.toCelsiusString(0)}',
                            style: Theme.of(context).textTheme.displayLarge
                                ?.copyWith(
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
                            style: Theme.of(context).textTheme.headlineSmall
                                ?.copyWith(
                                  fontWeight: FontWeight.w500,
                                  color: Theme.of(
                                    context,
                                  ).colorScheme.secondary,
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
            ),
            SliverToBoxAdapter(
              child: Container(
                margin: EdgeInsets.all(Dimensions.paddingS),
                child: Card.outlined(
                  child: Padding(
                    padding: EdgeInsets.all(Dimensions.paddingS),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CardInsideTitleWidget(
                              content:
                                  '${firstItem?.main.feelsLike.toCelsiusString(0)}',
                              title: 'Feels Like',
                            ),
                            CardInsideTitleWidget(
                              title: 'Humidity',
                              content: '${firstItem?.main.humidity}',
                            ),
                            CardInsideTitleWidget(
                              title: 'Pressure',
                              content: '${firstItem?.main.pressure}',
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
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: Dimensions.paddingS / 2,
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          DateTime.parse(
                                            weather?.dateText ?? '',
                                          ).getHourOnlyString(),
                                          style: Theme.of(
                                            context,
                                          ).textTheme.bodyMedium,
                                        ),

                                        SizedBox(
                                          width: 50,
                                          height: 50,
                                          child: CachedNetworkImage(
                                            imageUrl:
                                                weather?.weather.first.icon
                                                    .getWeatherIcon() ??
                                                '',
                                            errorWidget:
                                                (context, url, error) =>
                                                    const Icon(Icons.error),
                                          ),
                                        ),

                                        Text(
                                          '${weather?.main.temp.toCelsiusString(0)}',
                                          style: Theme.of(
                                            context,
                                          ).textTheme.bodyMedium,
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            );
                          },
                          error: (e, _) {
                            return Container();
                          },
                          loading: () {
                            return Container();
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Next 5 Days Forecast', 
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            fiveDaysValue.when(
              data: (items) {
                return SliverList.builder(
                  itemCount: items.length,
                  itemBuilder: (_, index) {
                    final weather = items[index];
                    return Column(
                      children: [
                        ListTile(
                          leading: CachedNetworkImage(
                            imageUrl:
                                weather?.weather.first.icon.getWeatherIcon() ??
                                '',
                            width: 40,
                            height: 40,
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                          ),

                          title: Text(
                            '${weather?.main.temp.toCelsiusString(0)}',
                          ),
                          subtitle: Text(
                            '${weather?.weather.first.description}',
                          ),

                          trailing: Text(
                            DateTime.parse(
                              weather?.dateText ?? '',
                            ).getWithoutTimeString(),
                          ),
                        ),
                        const Divider(height: 1),
                      ],
                    );
                  },
                );
              },
              error: (e, _) => Container(),
              loading: () => Container(),
            ),
          ],
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Error: $e')),
      ),
    );
  }
}
