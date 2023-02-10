import 'package:animation/utils/constants.dart';
import 'package:animation/utils/customRoute.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: Constants.forthPage,
    onGenerateRoute: CustomRoute.ongenerateRoute,
  ));
}


