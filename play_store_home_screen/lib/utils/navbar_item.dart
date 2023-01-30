import 'package:flutter/material.dart';

class NavbarItem{
  String item;
  var icon;
  NavbarItem({required this.item,required this.icon});

  BottomNavigationBarItem getNavItem(){
   return  BottomNavigationBarItem(
      icon: Icon(icon),
      label: item,
    );
  }
}

