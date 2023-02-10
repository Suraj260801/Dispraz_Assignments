import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:morphable_shape/morphable_shape.dart';

class ForthPage extends StatefulWidget {
  const ForthPage({Key? key}) : super(key: key);

  @override
  State<ForthPage> createState() => _ForthPageState();
}

class _ForthPageState extends State<ForthPage> with TickerProviderStateMixin {
///polygon shapes from third party library morphable shapes which allows to switch between
///different polygons dynamically.To switch between different polygons specify no of slides
///in constructor of PolygonShapeBorder.beginShape,midShape,endShape are three stages over
/// which we are animating._controller1 and _controller used to control animation from rect
///angle to circle and circle to hexagon resp.firstColorAnimation ,secondColorAnimation are
///actual dynamically changing color values over duration specified in respective controller.
///rectToCircleAnimation ,circToHexAnimation are actual dynamically changing color values
/// over duration specified in respective controller.

  final beginShape = const PolygonShapeBorder(sides: 4);
  final midShape = const PolygonShapeBorder(cornerRadius: Length(100));
  final endShape = const PolygonShapeBorder(sides: 6);
  late AnimationController _controller1;
  late AnimationController _controller2;
  late Animation rectToCicleAnimation;
  late Animation firstColorAnimation;
  late Animation secondColorAnimation;
  late Animation circToHexAnimation;
  int state = 0;
  late ValueNotifier<Animation> controller;
///_controller1,_controller2 are initialized in initState method with required parameters.
///firstColorAnimation,secondColorAnimation are initialized with colorTween and the colors
///between which shapes are animating.animate method is used to animate(change) tween values
///over duration with the help of controller.MorphableShapeBorderTween is used initialize
///morphable shape tween and animate between two morphable shapes.addListener listens to the
///changing tween values over time and animates shape.
  @override
  void initState() {
    super.initState();
    _controller1 =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    _controller2 =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    firstColorAnimation =
        ColorTween(begin: Colors.blue, end: Colors.green).animate(_controller1);
    secondColorAnimation =
        ColorTween(begin: Colors.green, end: Colors.red).animate(_controller2);
    rectToCicleAnimation =
        Tween<double>(begin: 0.0, end: 100.0).animate(_controller1);
    rectToCicleAnimation =
        MorphableShapeBorderTween(begin: beginShape, end: midShape)
            .animate(_controller1);
    circToHexAnimation =
        MorphableShapeBorderTween(begin: midShape, end: endShape)
            .animate(_controller2);
    //controller = _controller1;
    controller=ValueNotifier(_controller1);
    _controller1.addListener(() {});
    _controller2.addListener(() {});
  }

   ///controller is a variable keeps on switching controller1 and controller2 based on
  ///requirement.Initially controller is set to firstController responsible to animate from
  ///rectangle to circle.When animating  to circle controller is set to controller2 for next
  ///animation.In onTap method of Inkwell specific animation is shown using respected controller
  ///and based on current state of animation.rectToCircAnimation value is assigned to shape which
  ///belongs to shapeDecoration instead boxDecoration.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Animation Assignment'),
        ),
        body: ValueListenableBuilder(
          valueListenable: controller,
          builder: (BuildContext context, value, Widget? child) {
            return AnimatedBuilder(
              animation: controller.value,
              builder: (BuildContext context, Widget? child) {
                return Column(
                  children: [
                    Center(
                      child: InkWell(
                        onTap: () async {
                          if (state == 0) {
                            await _controller1.forward();
                            state = 1;
                            controller.value = _controller2;
                          } else {
                            _controller2.forward();
                            state = 2;
                          }
                        },
                        child: Container(
                          width: 200,
                          height: 200,
                          decoration: ShapeDecoration(
                            color: state == 0
                                ? firstColorAnimation.value
                                : secondColorAnimation.value,
                            shape: state == 0
                                ? rectToCicleAnimation.value
                                : circToHexAnimation.value,
                          ),
                        ),
                      ),
                    ),
                    ElevatedButton(
                        onPressed: () async {
                          if (state == 1) {
                            _controller1.reverse();
                            state = 0;
                          } else {
                            await _controller2.reverse();
                            state = 1;
                            controller.value = _controller1;
                          }
                        },
                        child: const Text('Revert')),
                  ],
                );
              },
            );
          },
        ));
  }
}
