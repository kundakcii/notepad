import 'package:flutter/material.dart';

class MobileScreenAppBarProvider with ChangeNotifier {
  PageController _pageController = PageController();

  int _page = 0;

  get pageController => _pageController;

  void setPageController(pageController) {
    _pageController = pageController;
    notifyListeners();
  }

  get getPage => _page;

  void setOnPageChanged(int page) {
    _page = page;
    notifyListeners();
  }

  void navigationTapped(int page) {
    //Animating Page
    pageController.jumpToPage(page);
  }

  Color setColors() {
    if (_page == 0) {
      return Color.fromARGB(224, 173, 1, 1);
    } else if (_page == 1) {
      return Color.fromARGB(223, 5, 196, 209);
    } else if (_page == 2) {
      return Color.fromARGB(224, 136, 46, 128);
    } else if (_page == 3) {
      return Color.fromARGB(225, 85, 122, 16);
    }
    return Color.fromARGB(225, 10, 122, 113);
  }
  
}
