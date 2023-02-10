import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Animation Using TweenAnimation Builder',
        ),
      ),
      body: Column(
        children: [
          TweenAnimationBuilder(
            tween: Tween<double>(begin: 0, end: 1),
            duration: const Duration(seconds: 4),
            builder: (BuildContext context, double value, Widget? child) {
              return Opacity(
                opacity: value,
                child: Padding(
                  padding: EdgeInsets.all(value * 20),
                  child: Text(
                    'Suraj',
                    style: TextStyle(
                      fontSize: value*30,
                    ),
                  ),
                ),
              );
            },

          ),
          InkWell(
            onTap:  (){Navigator.pushReplacementNamed(context, '/ThirdPage');},
            child: const Hero(
                tag: 'unique_id',
                child: CircleAvatar(
                  backgroundImage: AssetImage('assets/images/ironman.jpg'),
                  radius: 30,
                )),
          ),
          Center(
            child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/ThirdPage');
                },
                child: const Text('page 3')),
          ),
        ],
      ),
    );
    ;
  }
}
