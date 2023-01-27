import 'package:assignment_3/tabs/second_tab.dart';
import 'package:flutter/material.dart';

class SecondTabProvider extends ChangeNotifier {
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
  static int countSelected = 0;

  void changeSelectedTile(int index) {
    if (isSelected[index] == false) {
      countSelected++;
      isSelected[index] = true;

      notifyListeners();
    } else {
      countSelected--;
      isSelected[index] = false;
      notifyListeners();
    }
  }
}
