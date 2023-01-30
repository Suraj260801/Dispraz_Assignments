import 'package:flutter/material.dart';


class Suggestions extends StatelessWidget {
  final String name;
  const Suggestions({super.key, required this.name});
  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton(
            onPressed: () {},
            child: Text(
              name,
              style: const TextStyle(color: Colors.black, fontSize: 18),
            )),
        IconButton(
            onPressed: () {}, icon: const Icon(Icons.arrow_forward))
      ],
    );
  }
}


