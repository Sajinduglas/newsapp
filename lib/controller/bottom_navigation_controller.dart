import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../view/catagory_screen.dart';
import '../view/home_screen.dart';
import '../view/search_screen.dart';
import 'catogory_controller.dart';

class BottomNavigationController extends ChangeNotifier{
 int selectedIndex=0;
 List<Widget>myPages=[ HomeScreen(),CategoryScreen(),SearchScreen()];
 void onTap(index,context){
   selectedIndex=index;
   if(index==1){
     Provider.of<CategoryController>(context,listen: false).fetchData();
   }
   notifyListeners();
 }
}