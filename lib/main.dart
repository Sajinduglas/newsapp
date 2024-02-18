import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/view/mainpage.dart';
import 'package:provider/provider.dart';
import 'controller/bottom_navigation_controller.dart';
import 'controller/catogory_controller.dart';
import 'controller/home_screen_controller.dart';
import 'controller/search_controller.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => HomeScreenController()),
      ChangeNotifierProvider(create: (context) => SearchScreenController()),
      ChangeNotifierProvider(create: (context) => BottomNavigationController()),
      ChangeNotifierProvider(create: (context) => CategoryController()),
    ],
      child: MaterialApp(
        theme:  ThemeData(),
        debugShowCheckedModeBanner: false,
        home: MainPage(),
      ),

    );
  }
}
