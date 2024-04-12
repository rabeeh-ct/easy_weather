import 'package:easy_weather/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:provider/provider.dart';

import '../screens/home_screen/home_screen_controller.dart';
import '../theme/colors.dart';
import '../theme/textStyle.dart';
import 'customShimmer.dart';

class MainWeatherDetail extends StatelessWidget {
  const MainWeatherDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeScreenController>(builder: (context, weatherProv, _) {
      if (weatherProv.isLoading) {
        return CustomShimmer(
          height: 132.0,
          borderRadius: BorderRadius.circular(16.0),
        );
      }
      return Container(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        decoration: BoxDecoration(
          color: backgroundWhite,
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: IntrinsicHeight(
                child: Row(
                  children: [
                    DetailInfoTile(
                        icon: const PhosphorIcon(
                          PhosphorIconsRegular.thermometerSimple,
                          color: Colors.white,
                        ),
                        title: 'Feels Like',
                        data: weatherProv.isCelsius
                            ? '${weatherProv.weather.feelsLike.toStringAsFixed(1)}°'
                            : '${weatherProv.weather.feelsLike.toFahrenheit().toStringAsFixed(1)}°'),
                    const VerticalDivider(
                      thickness: 1.0,
                      indent: 4.0,
                      endIndent: 4.0,
                      color: backgroundBlue,
                    ),
                    DetailInfoTile(
                      icon: const PhosphorIcon(
                        PhosphorIconsRegular.dropHalfBottom,
                        color: Colors.white,
                      ),
                      title: 'Humidity',
                      data: '${weatherProv.weather.humidity}%',
                    ),
                    const VerticalDivider(
                      thickness: 1.0,
                      indent: 4.0,
                      endIndent: 4.0,
                      color: backgroundBlue,
                    ),
                    DetailInfoTile(
                      icon: const PhosphorIcon(
                        PhosphorIconsRegular.wind,
                        color: Colors.white,
                      ),
                      title: 'Wind',
                      data: '${weatherProv.weather.windSpeed} m/s',
                    ),
                  ],
                ),
              ),
            ),
            const Divider(
              thickness: 1.0,
              color: backgroundBlue,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: IntrinsicHeight(
                child: Row(
                  children: [
                    DetailInfoTile(
                      icon: const PhosphorIcon(
                        PhosphorIconsRegular.thermometerSimple,
                        color: Colors.white,
                      ),
                      title: 'Temp Min',
                      data:
                          "${weatherProv.isCelsius ? weatherProv.weather.tempMin.toStringAsFixed(1) : weatherProv.weather.tempMin.toFahrenheit().toStringAsFixed(1)}°",
                    ),
                    const VerticalDivider(
                      thickness: 1.0,
                      indent: 4.0,
                      endIndent: 4.0,
                      color: backgroundBlue,
                    ),
                    DetailInfoTile(
                      icon: const PhosphorIcon(
                        PhosphorIconsRegular.thermometerHot,
                        color: Colors.white,
                      ),
                      title: 'Temp Max',
                      // data: "no data"
                      data:
                          "${weatherProv.isCelsius ? weatherProv.weather.tempMax.toStringAsFixed(1) : weatherProv.weather.tempMax.toFahrenheit().toStringAsFixed(1)}°",
                    ),
                    const VerticalDivider(
                      thickness: 1.0,
                      indent: 4.0,
                      endIndent: 4.0,
                      color: backgroundBlue,
                    ),
                    DetailInfoTile(
                      icon: const PhosphorIcon(
                        PhosphorIconsRegular.gauge,
                        color: Colors.white,
                      ),
                      title: 'Pressure',
                      // data: "no data"
                      data: '${weatherProv.weather.pressure} mb',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}

class DetailInfoTile extends StatelessWidget {
  final String title;
  final String data;
  final Widget icon;

  const DetailInfoTile({
    super.key,
    required this.title,
    required this.data,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(backgroundColor: primaryBlue, child: icon),
          const SizedBox(width: 8.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FittedBox(child: Text(title, style: lightText)),
                FittedBox(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(minWidth: 1.0),
                    child: Text(
                      data,
                      style: mediumText,
                      maxLines: 1,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
