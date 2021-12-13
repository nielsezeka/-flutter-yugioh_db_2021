import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_yugioh_2021/presentationals/screens/main_screen/main_screen.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:flutter_yugioh_2021/services/custom_theme_provider/custom_theme_provider.dart';

class TabbarWithScreens extends StatefulWidget {
  const TabbarWithScreens({Key? key}) : super(key: key);

  @override
  State<TabbarWithScreens> createState() => _TabbarWithScreensState();
}

class _TabbarWithScreensState extends State<TabbarWithScreens>
    with CustomThemeMixin {
  int _childIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const MainScreen(),
      bottomNavigationBar: FlashyTabBar(
        backgroundColor:
            themeDisplayFor(context).currentTheme().appBackgroundColor,
        selectedIndex: _childIndex,
        showElevation: true,
        onItemSelected: (index) {
          setState(() {
            _childIndex = index;
          });
        },
        items: [
          FlashyTabBarItem(
            icon: Icon(PhosphorIcons.cards_bold),
            title: Text('All cards'),
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
