import 'package:flutter/material.dart';

class ListItemData {
  String name;
  String rating;
  String category;
  Image icon;
  Widget image;

  ListItemData({
    required this.name,
    required this.rating,
    required this.category,
    required this.icon,
    required this.image
  });
}
