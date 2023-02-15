import 'package:flutter/material.dart';

class HelperContainer extends StatelessWidget {
  final String helperText;

  const HelperContainer({Key? key, required this.helperText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10,top: 5),
      child: Row(
        children: [
          Text(helperText,style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
          const Icon(Icons.arrow_forward_rounded)
        ],
      ),
    );
  }
}
