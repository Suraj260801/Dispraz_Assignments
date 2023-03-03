import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import '../pages/home_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      backgroundColor: Colors.white,
      animationDuration: const Duration(seconds: 2),

      splash: Center(
        child: SizedBox(
          height: 500,
          child: Image.asset(
            'assets/images/image.gif',
            fit: BoxFit.fill,
          ),
        ),
      ),
      nextScreen:const HomePage(),
    ) ;
  }
}
