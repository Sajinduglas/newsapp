import 'package:flutter/material.dart';
import 'package:newsapp/view/utils/colors/mycolors.dart';
import 'package:provider/provider.dart';

import '../contoller/bottom_navigation_controller.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {

    var mainProvider = Provider.of<BottomNavigationController>(context);
    return Scaffold(
      body: mainProvider.myPages[mainProvider.selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
       unselectedItemColor: MyColors.bgColor,
          selectedItemColor: MyColors.blackColor,
          showUnselectedLabels: false,
elevation: 0,

          onTap: mainProvider.onTap,
          currentIndex: mainProvider.selectedIndex,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.category), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search")
          ]),
    );
  }
}
/*
body:mainProvider.myPages[Provider.of<BottomNavigationController>(context).selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: Provider.of<BottomNavigationContoller>(context, listen: false).selectedIndex,
          onTap: Provider.of<BottomNavigationContoller>(context).onTap,
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                ),
                label: "HOME"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.category,
                ),
                label: "catagory"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.search,
                ),
                label: "search")
          ]),
 */
