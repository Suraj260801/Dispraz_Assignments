import 'package:flutter/material.dart';

class TabBarItem extends StatelessWidget {
  final String category;
  const TabBarItem({super.key, required this.category, });

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
