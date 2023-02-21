import 'package:flutter/material.dart';
import 'package:news_api/services/news_provider.dart';
import 'package:news_api/utils/constants.dart';
import 'package:news_api/utils/custom_route.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => NewsProvider(),
      child: MaterialApp(
        initialRoute: Constants.splashScreen,
        onGenerateRoute: CustomRoute.generateRoute,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blueGrey,backgroundColor: Colors.blueGrey)
        ),
      ),
    );
  }
}
