import 'package:easy_weather/presentation/widgets/default_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:material_floating_search_bar_2/material_floating_search_bar_2.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:provider/provider.dart';

import '../../theme/colors.dart';
import '../../theme/textStyle.dart';
import '../../widgets/WeatherInfoHeader.dart';
import '../../widgets/mainWeatherDetail.dart';
import '../../widgets/mainWeatherInfo.dart';
import 'components/locationError.dart';
import 'components/requestError.dart';
import 'home_screen_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  FloatingSearchBarController fsc = FloatingSearchBarController();

  @override
  void initState() {
    super.initState();
    requestWeather();
  }

  Future<void> requestWeather() async {
    await Provider.of<HomeScreenController>(context, listen: false)
        .getData(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: AppBar().preferredSize,
        child: const DefaultAppBar(title: "EaseWeather",back: false,),
      ),
      body: Consumer<HomeScreenController>(
        builder: (context, weatherProv, _) {
          if (!weatherProv.isLoading && !weatherProv.isLocationserviceEnabled) {
            return const LocationServiceErrorDisplay();
          }

          if (!weatherProv.isLoading &&
              weatherProv.locationPermission != LocationPermission.always &&
              weatherProv.locationPermission != LocationPermission.whileInUse) {
            return const LocationPermissionErrorDisplay();
          }

          if (weatherProv.isRequestError) return const RequestErrorDisplay();

          if (weatherProv.isSearchError) return SearchErrorDisplay(fsc: fsc);

          return Stack(
            children: [
              ListView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.all(20.0).copyWith(
                  top: kToolbarHeight +
                      MediaQuery.viewPaddingOf(context).top +
                      24.0,
                ),
                children: [
                  WeatherInfoHeader(),
                  const SizedBox(height: 16.0),
                  MainWeatherInfo(),
                  const SizedBox(height: 16.0),
                  const MainWeatherDetail(),
                  const SizedBox(height: 24.0),
                  // TwentyFourHourForecast(),
                  // const SizedBox(height: 18.0),
                  // SevenDayForecast(),
                ],
              ),
              CustomSearchBar(fsc: fsc),
            ],
          );
        },
      ),
    );
  }
}

class CustomSearchBar extends StatefulWidget {
  final FloatingSearchBarController fsc;

  const CustomSearchBar({
    super.key,
    required this.fsc,
  });

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  final List<String> _citiesSuggestion = [
    'New York',
    'Tokyo',
    'Dubai',
    'London',
    'Singapore',
    'Sydney',
    'Wellington'
  ];

  @override
  Widget build(BuildContext context) {
    return FloatingSearchBar(
      controller: widget.fsc,
      hint: 'Search...',
      clearQueryOnClose: false,
      scrollPadding: const EdgeInsets.only(top: 16.0, bottom: 56.0),
      transitionDuration: const Duration(milliseconds: 400),
      borderRadius: BorderRadius.circular(16.0),
      transitionCurve: Curves.easeInOut,
      accentColor: primaryBlue,
      hintStyle: regularText,
      queryStyle: regularText,
      physics: const BouncingScrollPhysics(),
      elevation: 2.0,
      debounceDelay: const Duration(milliseconds: 500),
      onQueryChanged: (query) {},
      onSubmitted: (query) async {
        widget.fsc.close();
        await Provider.of<HomeScreenController>(context, listen: false)
            .searchWeather(query,context);
      },
      transition: CircularFloatingSearchBarTransition(),
      actions: [
        const FloatingSearchBarAction(
          showIfOpened: false,
          child: PhosphorIcon(
            PhosphorIconsBold.magnifyingGlass,
            color: primaryBlue,
          ),
        ),
        FloatingSearchBarAction.icon(
          showIfClosed: false,
          showIfOpened: true,
          icon: const PhosphorIcon(
            PhosphorIconsBold.x,
            color: primaryBlue,
          ),
          onTap: () {
            if (widget.fsc.query.isEmpty) {
              widget.fsc.close();
            } else {
              widget.fsc.clear();
            }
          },
        ),
      ],
      builder: (context, transition) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Material(
            color: Colors.white,
            elevation: 4.0,
            child: ListView.separated(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.zero,
              itemCount: _citiesSuggestion.length,
              itemBuilder: (context, index) {
                String data = _citiesSuggestion[index];
                return InkWell(
                  onTap: () async {
                    widget.fsc.query = data;
                    widget.fsc.close();
                    await Provider.of<HomeScreenController>(context,
                            listen: false)
                        .searchWeather(data,context);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(22.0),
                    child: Row(
                      children: [
                        const PhosphorIcon(PhosphorIconsFill.mapPin),
                        const SizedBox(width: 22.0),
                        Text(data, style: mediumText),
                      ],
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) => const Divider(
                thickness: 1.0,
                height: 0.0,
              ),
            ),
          ),
        );
      },
    );
  }
}
