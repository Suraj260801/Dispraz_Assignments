import 'package:assignment_3/Providers/second_tab_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SecondTab extends StatefulWidget {
  const SecondTab({Key? key}) : super(key: key);

  @override
  State<SecondTab> createState() => _SecondTabState();
}

class _SecondTabState extends State<SecondTab> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(),
        child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return ChangeNotifierProvider<SecondTabProvider>(
                  create: (context) => SecondTabProvider(),
                  child: Consumer<SecondTabProvider>(
                      builder: (context, provider, child) {
                    return ListTile(
                      textColor: Colors.black,
                      selectedColor: Colors.black,
                      leading: Icon(Icons.person),
                      title: Text('Title'),
                      subtitle: Text('Subtitle'),
                      selectedTileColor: Colors.teal.shade300,
                      enabled: true,
                      selected: provider.isSelected[index],
                      onTap: () {
                        SecondTabProvider.countSelected >= 1
                            ? provider.changeSelectedTile(index)
                            : () {};
                      },
                      onLongPress: () => provider.changeSelectedTile(index),
                    );
                  }));
            }));
  }
}
