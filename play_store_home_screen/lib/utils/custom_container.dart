import 'package:flutter/material.dart';
import 'package:play_store_home_screen/utils/list_item_data.dart';

import 'ListItem.dart';

class CustomContainer extends StatelessWidget {
  final List<ListItemData>listItem;
  const CustomContainer({super.key, required this.listItem});

  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: const BoxDecoration(color: Colors.white),
      height: 230.0,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: listItem.length,
          itemBuilder: (context, index) {
            return ListItem(data: listItem[index]);
          }),
    );
  }
}
