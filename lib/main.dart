import 'package:easy_weather/presentation/screens/home_screen/home_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'presentation/routes/route_constants.dart';
import 'presentation/routes/routes.dart';
import 'presentation/theme/theme.dart';
import 'utils/setup_app.dart';

void main() async {
  await setupApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeScreenController(),
      child: MaterialApp(
        title: 'Easy Weather',
        debugShowCheckedModeBanner: false,
        // theme: themeData(context),
        initialRoute: RouteList.initial,
        routes: Routes.routes,
      ),
    );
  }
}
