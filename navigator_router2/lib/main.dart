import 'package:flutter/material.dart';
import 'package:navigator_router2/pages/homepage.dart';
import 'package:navigator_router2/pages/second_page.dart';
import 'package:navigator_router2/pages/thirdpage.dart';

void main() {
  var username = ValueNotifier('');
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => Homepage(),
      '/second page': (context) => SecondPage(
            username: username,
            isFromThird: false,
          ),
      '/third_page': (context) => ThirdPage(),
    },
  ));
}
