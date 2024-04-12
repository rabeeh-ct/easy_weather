import 'dart:async';

import 'package:easy_weather/presentation/screens/home_screen/home_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';

import '../../../../utils/debug_utils.dart';
import '../../../theme/colors.dart';
import '../../../theme/textStyle.dart';

class LocationPermissionErrorDisplay extends StatelessWidget {
  const LocationPermissionErrorDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeScreenController>(builder: (context, weatherProv, _) {
      return Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.sizeOf(context).width,
                minWidth: 100,
                maxHeight: MediaQuery.sizeOf(context).height / 3,
              ),
              child: Image.asset('assets/images/locError.png'),
            ),
            Center(
              child: Text(
                'Location Permission Error',
                style: boldText.copyWith(color: primaryBlue),
              ),
            ),
            const SizedBox(height: 4.0),
            Center(
              child: Text(
                weatherProv.locationPermission ==
                        LocationPermission.deniedForever
                    ? 'Location permissions are permanently denied, Please enable manually from app settings and restart the app'
                    : 'Location permission not granted, please check your location permission',
                style: mediumText.copyWith(color: Colors.grey.shade700),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 16.0),
            SizedBox(
              width: MediaQuery.sizeOf(context).width / 2,
              child: Column(
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryBlue,
                      textStyle: mediumText,
                      padding: const EdgeInsets.all(12.0),
                      shape: const StadiumBorder(),
                    ),
                    onPressed: weatherProv.isLoading
                        ? null
                        : () async {
                            if (weatherProv.locationPermission ==
                                LocationPermission.deniedForever) {
                              await Geolocator.openAppSettings();
                            } else {
                              weatherProv.getData(context, isLoad: true);
                            }
                          },
                    child: weatherProv.isLoading
                        ? const SizedBox(
                            width: 16.0,
                            height: 16.0,
                            child: CircularProgressIndicator(
                              strokeWidth: 3.0,
                              color: Colors.white,
                            ),
                          )
                        : Text(
                            weatherProv.locationPermission ==
                                    LocationPermission.deniedForever
                                ? 'Open App Settings'
                                : 'Request Permission',
                          ),
                  ),
                  const SizedBox(height: 4.0),
                  if (weatherProv.locationPermission ==
                      LocationPermission.deniedForever)
                    TextButton(
                      style: TextButton.styleFrom(foregroundColor: primaryBlue),
                      onPressed: weatherProv.isLoading
                          ? null
                          : () =>
                              weatherProv.getData(context, isLoad: true),
                      child: const Text('Restart'),
                    )
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}

class LocationServiceErrorDisplay extends StatefulWidget {
  const LocationServiceErrorDisplay({super.key});

  @override
  State<LocationServiceErrorDisplay> createState() =>
      _LocationServiceErrorDisplayState();
}

class _LocationServiceErrorDisplayState
    extends State<LocationServiceErrorDisplay> {
  late StreamSubscription<ServiceStatus> serviceStatusStream;

  late AppLifecycleState? _state;
  late final AppLifecycleListener _listener;

  @override
  void initState() {
    super.initState();
    serviceStatusStream = Geolocator.getServiceStatusStream().listen((_) {});
    serviceStatusStream.onData((ServiceStatus status) {
      if (status == ServiceStatus.enabled) {
        consoleLog('enabled');
        // Provider.of<HomeScreenController>(context, listen: false).getData(context);
      }
    });

    _listener = AppLifecycleListener(
      // onShow: () => _handleTransition('show'),
      onResume: () => Provider.of<HomeScreenController>(context, listen: false).getData(context),
      // onHide: () => _handleTransition('hide'),
      // onInactive: () => _handleTransition('inactive'),
      // onPause: () => _handleTransition('pause'),
      // onDetach: () => _handleTransition('detach'),
      // onRestart: () => _handleTransition('restart'),
      // // This fires for each state change. Callbacks above fire only for
      // // specific state transitions.
      // onStateChange: _handleStateChange,
    );
  }

  @override
  void dispose() {
    serviceStatusStream.cancel();
    _listener.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.sizeOf(context).width,
              minWidth: 100,
              maxHeight: MediaQuery.sizeOf(context).height / 3,
            ),
            child: Image.asset('assets/images/locError.png'),
          ),
          Center(
            child: Text(
              'Location Service Disabled',
              style: boldText.copyWith(color: primaryBlue),
            ),
          ),
          const SizedBox(height: 4.0),
          Center(
            child: Text(
              'Your device location service is disabled, please turn it on before continuing',
              style: mediumText.copyWith(color: Colors.grey.shade700),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 16.0),
          Consumer<HomeScreenController>(builder: (context, weatherProv, _) {
            return SizedBox(
              width: MediaQuery.sizeOf(context).width / 2,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryBlue,
                  textStyle: mediumText,
                  padding: const EdgeInsets.all(12.0),
                  shape: const StadiumBorder(),
                ),
                child: const Text('Turn On Service'),
                onPressed: () async {
                  await Geolocator.openLocationSettings();
                  // await Provider.of<HomeScreenController>(context, listen: false)
                  //     .getData(context);
                },
              ),
            );
          }),
        ],
      ),
    );
  }
}
