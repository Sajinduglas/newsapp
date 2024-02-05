import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/view/mainpage.dart';
import 'package:provider/provider.dart';
import 'contoller/bottom_navigation_controller.dart';
import 'contoller/catogory_controller.dart';
import 'contoller/home_screen_conntoller.dart';
import 'contoller/search_controller.dart';


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
      ChangeNotifierProvider(create: (context) => BottomNavigationContoller()),
      ChangeNotifierProvider(create: (context) => CategoryController()),
    ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MainPage(),
      ),

    );
  }
}
