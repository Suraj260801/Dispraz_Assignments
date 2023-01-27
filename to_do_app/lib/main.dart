import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import  'package:to_do_app/pages/home_page.dart';

void main() async {

  //creating box collection
  await Hive.initFlutter();

  //opening box collection
  var box=await Hive.openBox('mybox');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
      ),
      home: const HomePage(),
    );
  }
}



