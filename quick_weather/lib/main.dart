import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quick_weather/services/weather_provider.dart';
import 'package:quick_weather/utils/constants.dart';
import 'package:quick_weather/utils/custom_route.dart';
import 'package:hive_flutter/adapters.dart';

void main() async{

  //Initialize Hive
  await Hive.initFlutter();
  // Open the Hive box for the locationList data
  Hive.openBox('locationList');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final myTheme = ThemeData(
    useMaterial3: true,
    primarySwatch: Colors.blueGrey,
    appBarTheme: const AppBarTheme(backgroundColor: Colors.blueGrey),
    pageTransitionsTheme:  const PageTransitionsTheme(
        builders: {
          TargetPlatform.android:ZoomPageTransitionsBuilder()
        }
    ),
    // Other theme properties...
  );
  MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => WeatherProvider(),
      child: MaterialApp(
          initialRoute: Constants.splashScreen,
          onGenerateRoute: CustomRoute.generateRoute,
          debugShowCheckedModeBanner: false,
          theme:myTheme
      ),
    );
  }
}



