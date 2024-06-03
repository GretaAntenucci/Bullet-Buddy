import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:bullet_buddy/pages/home_page.dart';
import 'package:bullet_buddy/pages/profile_page.dart';
import 'package:bullet_buddy/pages/settings_page.dart';
import 'package:flutter/material.dart';

class CustomBottomBar extends StatefulWidget {
  const CustomBottomBar({super.key});

  @override
  State<CustomBottomBar> createState() => _CustomBottomBarState();
}

class _CustomBottomBarState extends State<CustomBottomBar> {
  final PageController _pageController = PageController();
  final ValueNotifier<int> _currentIndex = ValueNotifier(1);
  // int _currentIndex = 1;
  // int _pageIndex = 1;

  @override
  void initState() {
    // _currentIndex.value = 1;
    super.initState();

  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ///pages switch
      body: ValueListenableBuilder(
        valueListenable: _currentIndex,
        builder: (BuildContext context,int value,Widget? child) {
          return PageView(
            controller: _pageController,
            onPageChanged: (index){
              _currentIndex.value = index + 1;
              _pageController.jumpToPage(_currentIndex.value-1,);
            },
            children:  const <Widget>[
              //NewDiaryPage(),
              HomePage(),
              ProfilePage(),
              SettingsPage(),
            ],
          );
        }
      ),
      ///curved bottom bar
      bottomNavigationBar: ValueListenableBuilder(
          valueListenable: _currentIndex,
          builder: (BuildContext context,int value,Widget? child) {
          return CurvedNavigationBar(
            index: _currentIndex.value,
            backgroundColor: Colors.blueGrey,
            buttonBackgroundColor: Colors.white,
            color: const Color.fromARGB(255, 255, 240, 219),
            height: 65,
            ///Icon Button
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
            onTap: (index)  {
              if(index == 0){
                _currentIndex.value = 0;
                Navigator.of(context).pushNamed('/new').then((_) {
                  _currentIndex.value++;
                  _pageController.jumpToPage(_currentIndex.value-1);
                });
                } else {
                _pageController.jumpToPage(index-1);
              }
            },
          );
        }
      ),
    );
  }
}
