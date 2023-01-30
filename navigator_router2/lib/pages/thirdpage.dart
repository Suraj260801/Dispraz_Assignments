import 'package:flutter/material.dart';
import 'package:navigator_router2/pages/homepage.dart';
import 'package:navigator_router2/pages/second_page.dart';

import 'homepage.dart';

class ThirdPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Thirdpage'),
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
                child: Text(
              '${args['key1']}',
              style: const TextStyle(color: Colors.cyan, fontSize: 25.0),
            )),
            const SizedBox(
              height: 30.0,
            ),
            const Text(
              'Are You Sure Want to Submit',
              style: TextStyle(fontSize: 20.0),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    args['notifier'].value = args['key1']!;
                    Navigator.popUntil(context, ModalRoute.withName('/'));
                  },
                  child: const Text('Yes'),
                ),
                const SizedBox(
                  width: 20.0,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context,args['key1'].toString());
                  },
                  child: const Text('No'),
                ),
              ],
            )
          ]),
    );
  }
}
