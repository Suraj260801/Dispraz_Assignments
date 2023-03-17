import 'package:flutter/material.dart';
import 'package:quick_weather/pages/archives.dart';
import 'package:quick_weather/pages/new_location.dart';

import 'constants.dart';
import '../pages/home_page.dart';
import '../pages/splash_screen.dart';
class CustomRoute{
static Route<dynamic> generateRoute(RouteSettings settings){

  final dynamic args=settings.arguments;
  switch(settings.name){
    case Constants.splashScreen:
      return MaterialPageRoute(builder:(context)=> const SplashScreen(),);
    case Constants.homePage:
      return MaterialPageRoute(builder:(context)=> const HomePage());
    case Constants.newLocation:
      return MaterialPageRoute(builder:(context)=> NewLocation(),
          settings: RouteSettings(arguments: args));
    case Constants.archives:
      return MaterialPageRoute(builder:(context)=> const Archives(),
      settings: RouteSettings(arguments: args));
    default:
      return _errorRoute();
  }
}
static Route<dynamic> _errorRoute(){
  return MaterialPageRoute(builder: (context)=>
      Scaffold(
        appBar: AppBar(title: const Text('Error'),),
      )
  );
}
}

