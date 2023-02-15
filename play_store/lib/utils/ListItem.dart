import 'package:flutter/material.dart';
import 'package:play_store_home_screen/utils/list_item_data.dart';

class ListItem extends StatelessWidget {
  ListItemData data;

  ListItem({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 10.0),
        padding: const EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
        width: 300.0,

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
              const SizedBox(height: 5,),
              Row(
                children: [
                  CircleAvatar(
                    child: data.imageIcon
                  ),
                  const SizedBox(width: 10,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data.name,
                        style: const TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: [
                          Text(data.rating, style: const TextStyle(color: Colors.black,fontWeight: FontWeight.bold)),
                          const Icon(Icons.star,size: 15,)
                        ],
                      ),
                      Text(data.category, style: const TextStyle(color: Colors.black,fontWeight: FontWeight.bold)),
                    ],
                  )
                ],
              ),

            ]));
  }
}
