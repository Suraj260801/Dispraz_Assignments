import 'package:animation/pages/forth_page.dart';
import 'package:animation/utils/constants.dart';
import 'package:flutter/material.dart';

import '../pages/homeage.dart';
import '../pages/secondPage.dart';
import '../pages/thirdPage.dart';

class CustomRoute{

  static Route<dynamic> ongenerateRoute(RouteSettings settings){
    switch(settings.name){
      case Constants.homePage:
        return MaterialPageRoute(builder: (_)=>const HomePage());
      case Constants.secondPage :
        return MaterialPageRoute(builder: (_)=>const SecondPage());
      case Constants.thirdPage:
        return MaterialPageRoute(builder: (_)=>const ThirdPage());
      case Constants.forthPage:
        return MaterialPageRoute(builder: (_)=>const ForthPage());
      default:
        return _errorRoute();

    }
  }
  static Route<dynamic> _errorRoute(){
    return MaterialPageRoute(builder: (_){
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('Error'),
        ),
      );
    });
  }
}