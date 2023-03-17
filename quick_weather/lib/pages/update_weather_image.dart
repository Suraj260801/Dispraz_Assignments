// import 'package:flutter/material.dart';
//
// class UpdateWeatherImage extends StatelessWidget {
//
//
//   late int index;
//   UpdateWeatherImage({required this.index,Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     final Size size = MediaQuery.of(context).size;
//     return   AnimatedSwitcher(
//       duration: const Duration(seconds: 4),
//       transitionBuilder: (child, animation) => FadeTransition(
//         opacity: animation,
//         child: child,
//       ),
//       child: Image.asset(
//         images[index],
//         key: ValueKey(images[index]),
//         fit: BoxFit.fill,
//         width: size.width,
//         height: size.height,
//       ),
//     );
//   }
// }
