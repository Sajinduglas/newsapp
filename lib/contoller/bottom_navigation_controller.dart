import 'package:flutter/material.dart';

import '../view/catagory_screen.dart';
import '../view/home_screen.dart';
import '../view/search_screen.dart';

class BottomNavigationController extends ChangeNotifier{
 int selectedIndex=0;
 List<Widget>myPages=[ HomeScreen(),CategoryScreen(),SearchScreen()];
 void onTap(index){
   selectedIndex=index;
   notifyListeners();
 }
}