import 'package:flutter/material.dart';
import '../pages/splash_screeen.dart';

import '../pages/homepage.dart';
import '../pages/description.dart';
import '../pages/image_view.dart';
import 'constants.dart';

class CustomRoute {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    final dynamic args = settings.arguments;

    ///arguments are received here passed in pushNamed method and they needs to
    ///be passed to target page.arguments received can be passed either using con-
    ///structor of the target class or directly through route settings arguments.
    switch (settings.name) {
      case Constants.homePage:
        return MaterialPageRoute(builder: (_) => const HomePage());
      case Constants.description:
        return MaterialPageRoute(
            builder: (_) => const Description(),
            settings: RouteSettings(arguments: args));

      case Constants.imageView:
        return MaterialPageRoute(
            builder: (_) => const ImageView(),
            settings: RouteSettings(arguments: args));
      case Constants.splashScreen:
        return MaterialPageRoute(builder: (_) => const SplashScreen());

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text("Error"),
        ),
      );
    });
  }
}
