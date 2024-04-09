import 'package:flutter/material.dart';

import '../routes/route_constants.dart';
import '../screens/home_screen/home_screen.dart';

class Routes {
  static Map<String, WidgetBuilder> get routes => {
        RouteList.initial: (context) => const HomeScreen(),

      };
}
