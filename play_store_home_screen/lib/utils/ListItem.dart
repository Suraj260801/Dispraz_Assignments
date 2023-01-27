import 'package:flutter/material.dart';
import 'package:play_store_home_screen/utils/list_item_data.dart';

class ListItem extends StatelessWidget {
  ListItemData data;

  ListItem({required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 10.0),
        padding: const EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
        width: 150.0,
        height: 200.0,
        decoration: const BoxDecoration(
          color: Colors.white,
          border: Border(
              top: BorderSide(width: 2.0),
              left: BorderSide(width: 2.0),
              right: BorderSide(width: 2.0),
              bottom: BorderSide(width: 2.0)),
        ),
        child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            //mainAxisSize: MainAxisSize.min,
            children: [
              data.image,
              Text(
                data.name,
                style: TextStyle(color: Colors.black),
              ),
              Text(data.rating, style: TextStyle(color: Colors.black)),
              Text(data.category, style: TextStyle(color: Colors.black)),
            ]));
  }
}
