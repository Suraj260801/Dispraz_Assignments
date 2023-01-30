import 'package:flutter/material.dart';

class ThirdTab extends StatefulWidget {
  const ThirdTab({Key? key}) : super(key: key);

  @override
  State<ThirdTab> createState() => _ThirdTabState();
}

class _ThirdTabState extends State<ThirdTab> {
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
  var countSelected = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(),
        child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return ValueListenableBuilder(
                  valueListenable: countSelected,
                  builder: (context, value, child) {
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
                        countSelected.value >= 1
                            ? changeSelectedCount(index)
                            : () {};
                      },
                      onLongPress: () => changeSelectedCount(index),
                    );
                  });
            }));
  }

  void changeSelectedCount(int index) {
    if (isSelected[index] == false) {
      isSelected[index] = true;
      countSelected.value++;
    } else {
      isSelected[index] = false;
      countSelected.value--;
    }
  }
}
