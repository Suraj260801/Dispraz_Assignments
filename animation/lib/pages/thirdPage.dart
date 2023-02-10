import 'dart:developer';
import 'dart:ui';

import 'package:flutter/material.dart';

class ThirdPage extends StatefulWidget {
  const ThirdPage({Key? key}) : super(key: key);

  @override
  State<ThirdPage> createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  static int i = 0;
  late Animation _colorAnimation;
  late Animation<double> fontSize;
  late Animation<double> fontWeight;
  bool toggle = false;
  bool fw = false;
  bool fs = false;

  @override
  void initState() {
    super.initState();

    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    fontSize = Tween<double>(begin: 10, end: 60).animate(_controller);
    _colorAnimation =
        ColorTween(begin: Colors.cyan, end: Colors.red).animate(_controller);
    fontWeight = Tween<double>(begin: 0, end: 1).animate(_controller);

    _controller.addListener(() {
      log('${fontWeight.value}');
      // print('${_controller.value} ${i++}');
      // print(_colorAnimation.value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animation using AnimatedBuilder'),
      ),
      body: Column(
        children: [
          const Hero(
              tag: 'unique_id',
              child: Image(image: AssetImage('assets/images/ironman.jpg'))),
          AnimatedBuilder(
            animation: _controller,
            builder: (BuildContext context, Widget? child) {
              return Column(
                children: [
                  TextButton(
                    child: Text(
                      'Suraj',
                      style: TextStyle(
                        fontSize: fs ? fontSize.value : 10,
                        fontWeight: fw
                            ? FontWeight.lerp(FontWeight.w100, FontWeight.w900,
                                fontWeight.value)
                            : FontWeight.normal,
                      ),
                    ),
                    onPressed: () {},
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            fs = true;
                            _controller.forward();
                          },
                          child: const Text('Animate fontsize')),
                      ElevatedButton(
                          onPressed: () {
                            fw = true;
                            _controller.forward();
                            setState(() {

                            });
                          },
                          child: const Text('Animate fontweight'))

                    ],
                  ),
                  ElevatedButton(
                      onPressed: (){
                        Navigator.pushReplacementNamed(context, '/forthPage');
                      },
                      child: const Text('Go to Page 4')
                  )
                ],
              );
            },
          ),

          // ElevatedButton(
          //   onPressed: () {
          //     Navigator.pop(context);
          //   },
          //   child: Text('Page 1'),
          // ),
          // AnimatedBuilder(
          //   animation: _controller,
          //   builder: (BuildContext context, Widget? child) {
          //     return IconButton(
          //       iconSize:fontSize.value,
          //       color: _colorAnimation.value,
          //       onPressed: () {
          //         _controller.forward();
          //       },
          //       icon: const Icon(
          //         Icons.heart_broken_sharp,
          //       ),
          //     );
          //   },
          // ),
        ],
      ),
    );
  }
}
