import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:twitter/pages/pochta_page.dart';
import 'package:twitter/pages/search_page.dart';
import 'package:twitter/pages/setting_page.dart';
import 'home_page.dart';
import 'notification_page.dart';

class MainView extends StatefulWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {

  int _currentIndex = 0;
  final PageController _pageController = PageController();

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: _pageController,
        children: [
          HomePage(),
          SearchPage(),
          NotificationPage(),
          PochtaPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        // type: BottomNavigationBarType.fixed,
        // fixedColor: Colors.transparent,
        items: [
          BottomNavigationBarItem(icon: SvgPicture.asset("assets/icons/home.svg"),label: ''),
          BottomNavigationBarItem(icon: SvgPicture.asset("assets/icons/search.svg"),label: ''),
          BottomNavigationBarItem(icon: SvgPicture.asset("assets/icons/bell.svg"),label: ''),
          BottomNavigationBarItem(icon: SvgPicture.asset("assets/icons/mail.svg"),label: ''),
        ],
        currentIndex: _currentIndex,
        selectedItemColor: Colors.amber[800],
        unselectedItemColor: Colors.grey,
        unselectedLabelStyle: TextStyle(color: Colors.black),
        showUnselectedLabels: true,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
          _pageController.jumpToPage(index);
        },
      ),

    );
  }
}
