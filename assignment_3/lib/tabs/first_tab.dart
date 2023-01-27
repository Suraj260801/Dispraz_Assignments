import 'package:flutter/material.dart';

class FirstTab extends StatefulWidget {
  const FirstTab({Key? key}) : super(key: key);

  @override
  State<FirstTab> createState() => _FirstTabState();
}

class _FirstTabState extends State<FirstTab> {
  List<bool> isSelected = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];
  int countSelected = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(),
        child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return StatefulBuilder(
                builder: (context, customSetState) {
                  return ListTile(
                    textColor: Colors.black,
                    selectedColor: Colors.black,
                    leading: Icon(Icons.list),
                    title: Text('Title'),
                    subtitle: Text('Subtitle'),
                    selectedTileColor: Colors.teal.shade300,
                    enabled: true,
                    selected: isSelected[index],
                    onTap: () {
                      countSelected >= 1 ? changeSelectedTile(index) : () {};
                      customSetState(() {});
                    },
                    onLongPress: () {
                      changeSelectedTile(index);
                      customSetState(() {});
                    },
                  );
                },
              );
            }));
  }

  void changeSelectedTile(int index) {
    if (isSelected[index] == false) {
      isSelected[index] = true;
      countSelected++;
    } else {
      isSelected[index] = false;
      countSelected--;
    }
  }
}
