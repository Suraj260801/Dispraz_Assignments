import 'package:assignment_3/tabs/first_tab.dart';
import 'package:assignment_3/tabs/second_tab.dart';
import 'package:assignment_3/tabs/third_tab.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Demo App'),
        ),
        body: Column(
          children: const [
            TabBar(
              tabs: [
                Tab(
                  child: Text(
                    'Tab 1',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                Tab(
                  child: Text('Tab 2', style: TextStyle(color: Colors.black)),
                ),
                Tab(
                  child: Text('Tab 3', style: TextStyle(color: Colors.black)),
                )
              ],
            ),
            Expanded(
              child: TabBarView(children: [
                FirstTab(),
                SecondTab(),
                ThirdTab(),
              ]),
            )
          ],
        ),
      ),
    );
  }
}
