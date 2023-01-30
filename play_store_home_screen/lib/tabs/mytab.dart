import 'package:flutter/material.dart';

class MyTab extends StatelessWidget {
  String category;

  MyTab({required this.category});

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Text(
        category,
        style: const TextStyle(
            color: Colors.black, fontWeight: FontWeight.bold),
      ),
    );

  }
}
