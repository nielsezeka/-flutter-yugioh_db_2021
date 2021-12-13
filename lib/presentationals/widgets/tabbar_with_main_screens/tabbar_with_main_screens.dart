import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';

class TabbarWithScreens extends StatelessWidget {
  const TabbarWithScreens({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: FlashyTabBar(
        selectedIndex: 0,
        showElevation: true,
        onItemSelected: (index) {},
        items: [
          FlashyTabBarItem(
            icon: Icon(Icons.event),
            title: Text('Events'),
          ),
          FlashyTabBarItem(
            icon: Icon(Icons.search),
            title: Text('Search'),
          ),
          FlashyTabBarItem(
            icon: Icon(Icons.highlight),
            title: Text('Highlights'),
          ),
          FlashyTabBarItem(
            icon: Icon(Icons.settings),
            title: Text('Settings'),
          ),
          FlashyTabBarItem(
            icon: Icon(Icons.settings),
            title: Text('한국어'),
          ),
        ],
      ),
    );
  }
}
