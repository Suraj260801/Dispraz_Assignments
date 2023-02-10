import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double _padding=0;
  double _margin=0;
   Color _color=Colors.green;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animation Using InBuilt Widgets'),
      ),
      body: Center(
        child: Column(
          children: [
            AnimatedContainer(
                duration: const Duration(seconds: 2),
                margin: EdgeInsets.all(_margin),
              padding: EdgeInsets.all(_padding),
              height: 200,
              width: 200,
              decoration:  BoxDecoration(
                color: _color,

              ),
              child: const Text('Hi Hello'),
            ),
            ElevatedButton(
                onPressed: (){
                  setState(() {
                    _margin=20;
                    _padding=30;
                    _color=Colors.cyan;
                  });
                },
                child: const Text('Animate')
            ),
            ElevatedButton(
                onPressed: (){
                  Navigator.pushNamed(context, '/SecondPage');
                },
                child: const Text('page 2')
            ),
          ],
        )
      ),
    );
  }
}
