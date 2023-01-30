import 'package:flutter/material.dart';
import 'package:navigator_router2/pages/thirdpage.dart';

class SecondPage extends StatelessWidget {
  final TextEditingController _nameController = TextEditingController();
  ValueNotifier<String> username = ValueNotifier('');


  SecondPage({super.key, required this.username,});

  @override
  Widget build(BuildContext context) {
    var args=ModalRoute.of(context)?.settings.arguments;
    _nameController.text=args!=null?args.toString():"";
    return Scaffold(
      appBar: AppBar(
        title: const Text('Secondpage'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _nameController,
              cursorHeight: 25.0,
              showCursor: true,
              decoration:  const InputDecoration(
                  hintText: 'Enter Your Name Here',
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 1.0, color: Colors.blue))),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/third_page', arguments: {
                  'key1': _nameController.text,
                  'notifier': username
                });
                _nameController.clear();
              },
              child: Text('Submit'),
            )
          ],
        ),
      ),
    );
  }
}
