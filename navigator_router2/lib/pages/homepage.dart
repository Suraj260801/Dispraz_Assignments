import 'package:flutter/material.dart';
import 'package:navigator_router2/pages/second_page.dart';

class Homepage extends StatelessWidget {
  String? user;
  ValueNotifier<String> username = ValueNotifier('----------');

  Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Homepage'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ValueListenableBuilder(
            valueListenable: username,
            builder: (BuildContext context, value, Widget? child) {
              return Center(
                  child: Text('Hello ${username.value} Welcome to Homepage'));
            },
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SecondPage(
                        username: username,
                        isFromThird: false,
                      ),
                    ));
              },
              child: const Text('Page 2'))
        ],
      ),
    );
  }
}
