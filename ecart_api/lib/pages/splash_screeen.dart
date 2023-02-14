import 'dart:async';

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'homepage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}
///Animated container provides in built support for customize splash screen.
class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSplashScreen(
        backgroundColor: Colors.cyan,
        duration: 3000,
          splashTransition: SplashTransition.rotationTransition,
          splash: const Center(
            child: Icon(Icons.shopping_cart,size: 50,),
          ),
          nextScreen: const HomePage())
    );
  }
}
