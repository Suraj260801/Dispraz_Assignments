import 'dart:math';
import 'package:flutter/material.dart';

class ImageView extends StatefulWidget {
  const ImageView({super.key});

  @override
  State<ImageView> createState() => _ImageViewState();
}

class _ImageViewState extends State<ImageView> {

  @override
  Widget build(BuildContext context) {
    final List<dynamic> args=ModalRoute.of(context)!.settings.arguments as List<dynamic>;
    final Size size=MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(args[1]),
      ),
      body: Hero(
        tag: args[0].toString(),
        child: Center(
          child: Image(
            fit: BoxFit.contain,
            width: size.width*.8,
            height: size.height*.8,
            image: NetworkImage(args[0]),
          ),
        ),

      ),

    );
  }
}
