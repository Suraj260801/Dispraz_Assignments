import 'package:flutter/material.dart';
import 'package:play_store_home_screen/utils/list_item_data.dart';

class ListItem extends StatelessWidget {
  ListItemData data;

  ListItem({required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
        padding: const EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
        width: 270.0,
        decoration: const BoxDecoration(
          color: Colors.white,
          border: Border(
          ),
        ),
        child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            //mainAxisSize: MainAxisSize.min,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: data.image,
              ),
              const SizedBox(height: 3.0,),
              Row(
                children: [
                  CircleAvatar(child: data.icon,),
                  const SizedBox(width:10.0 ,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        data.name,
                        style: const TextStyle(color: Colors.black),
                      ),
                      Text(data.rating, style: const TextStyle(color: Colors.black)),
                      Text(data.category, style: const TextStyle(color: Colors.black)),

                    ],

                  ),

                ],
              ),

            ]));
  }
}
