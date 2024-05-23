import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:bullet_buddy/pages/home_page.dart';
import 'package:bullet_buddy/pages/new_diary_page.dart';
import 'package:bullet_buddy/pages/profile_page.dart';
import 'package:bullet_buddy/pages/settings_page.dart';
import 'package:flutter/material.dart';

class CustomBottomBar extends StatefulWidget {
  const CustomBottomBar({super.key});

  @override
  State<CustomBottomBar> createState() => _CustomBottomBarState();
}

class _CustomBottomBarState extends State<CustomBottomBar> {
  final int initialPageIndex = 1;
  final _pageController = PageController(initialPage: 1);
  int _currentIndex = 1;

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (index){
          setState(() {
            _currentIndex = index;
          });
        },
        children:  const <Widget>[
          NewDiaryPage(),
          HomePage(),
          ProfilePage(),
          SettingsPage(),
        ],
      ),
      bottomNavigationBar:
      CurvedNavigationBar(
        index: _currentIndex,
        backgroundColor: Colors.blueGrey,
        buttonBackgroundColor: Colors.white,
        color: const Color.fromARGB(255, 255, 240, 219),
        height: 65,
        items:  <Widget>[
          const Icon(
            Icons.add_circle_outline,
            size: 35,
            color: Colors.orange,
          ),
          const Icon(
            Icons.home,
            size: 35,
            color: Colors.red,
          ),
          Icon(
            Icons.person,
            size: 35,
            color: Colors.pink[200]!,
          ),
          const Icon(
            Icons.settings,
            size: 35,
            color: Colors.purple,
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
          _pageController.animateToPage(index,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut);
        },
      ),
    );
  }
}
