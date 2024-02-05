import 'package:flutter/material.dart';

import '../view/catagory_screen.dart';
import '../view/home_screen.dart';
import '../view/search_screen.dart';

class BottomNavigationContoller extends ChangeNotifier{
  int selectedindex =0;

  void OnItemTap(index){
    selectedindex=index;
    notifyListeners();
  }

  List<Widget>mypages=[HomeScreen(),CatagoryScreen(),SearchScreen()];
}