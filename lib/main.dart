import 'package:easy_weather/presentation/screens/home_screen/home_screen_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'presentation/routes/route_constants.dart';
import 'presentation/routes/routes.dart';
import 'utils/setup_app.dart';

void main() async {
  await setupApp();
  runApp(MyApp());
}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     // final locale = setupLocale();
//     return MaterialApp(
//       title: 'Doob',
//       debugShowCheckedModeBanner: false,
//       // themeMode: themeMode,
//       // locale: locale,
//       // localizationsDelegates: AppLocalizations.localizationsDelegates,
//       // supportedLocales: AppLocalizations.supportedLocales,
//       theme: themeData(context),
//       // darkTheme: themeDataDark(context),
//       initialRoute: RouteList.initial,
//       routes: Routes.routes,
//     );
//   }
// }

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeScreenController(),
      child: MaterialApp(
        title: 'Flutter Weather',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.white,
            iconTheme: IconThemeData(color: Colors.blue),
            elevation: 0,
          ),
          scaffoldBackgroundColor: Colors.white,
          primaryColor: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          colorScheme:
          ColorScheme.fromSwatch().copyWith(secondary: Colors.white),
        ),

      initialRoute: RouteList.initial,
      routes: Routes.routes,
      ),
    );
  }
}