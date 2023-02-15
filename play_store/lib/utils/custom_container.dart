import 'package:flutter/material.dart';

import 'ListItem.dart';
import 'list_item_data.dart';


class CustomContainer extends StatelessWidget {
   final List<ListItemData> itemList;
   const CustomContainer({super.key, required this.itemList});

  @override
  Widget build(BuildContext context) {

    return Container(
      decoration: const BoxDecoration(color: Colors.white),
      height: 260.0,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: itemList.length,
          itemBuilder: (context, index) {
            return ListItem(data: itemList[index]);
          }),
    );
  }
}
