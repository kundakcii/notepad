import 'package:deneme_1/providers/mobile_screen_app_bar_provider.dart';
import 'package:deneme_1/utils/constants/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MobileScreenAppBar extends StatelessWidget {
  MobileScreenAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer(
        builder: (context,
                MobileScreenAppBarProvider _mobileScreenAppBarProvider,
                child) =>
            PageView(
          children: homeScreenItems,
          controller: _mobileScreenAppBarProvider.pageController,
          onPageChanged: _mobileScreenAppBarProvider.setOnPageChanged,
        ),
      ),
      bottomNavigationBar: Consumer(
        builder: (context,
                MobileScreenAppBarProvider _mobileScreenAppBarProvider,
                child) =>
            CupertinoTabBar(
                activeColor: _mobileScreenAppBarProvider.setColors(),
                inactiveColor: Color.fromARGB(156, 0, 0, 0),
                height: 65,
                items: <BottomNavigationBarItem>[
                  barItem(
                      Icons.plus_one, _mobileScreenAppBarProvider.setColors()),
                  barItem(Icons.list, _mobileScreenAppBarProvider.setColors()),
                  barItem(
                      Icons.search, _mobileScreenAppBarProvider.setColors()),
                ],
                onTap: _mobileScreenAppBarProvider.navigationTapped,
                currentIndex: _mobileScreenAppBarProvider.getPage),
      ),
    );
  }

  BottomNavigationBarItem barItem(IconData icon, Color color) {
    return BottomNavigationBarItem(
      icon: Consumer(
        builder:
            (context, MobileScreenAppBarProvider _MobileScreenAppBar, child) =>
                Container(
          decoration: BoxDecoration(
            border: Border.all(color: color),
            borderRadius: BorderRadius.circular(
              10,
            ),
          ),
          child: Icon(
            icon,
            size: 35,
          ),
        ),
      ),
      label: '',
      backgroundColor: Colors.amber,
    );
  }
}
