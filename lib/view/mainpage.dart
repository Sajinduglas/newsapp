import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../contoller/bottom_navigation_controller.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Provider.of<BottomNavigationContoller>(context).mypages[Provider.of<BottomNavigationContoller>(context).selectedindex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: Provider.of<BottomNavigationContoller>(context, listen: false).selectedindex,
          onTap: Provider.of<BottomNavigationContoller>(context).OnItemTap,
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
    );
  }
}
