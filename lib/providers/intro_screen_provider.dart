import 'package:flutter/material.dart';

class IntroProvider with ChangeNotifier {
  PageController _pageController = PageController();
  double _pageControllerCout = 0;

  get getPageController => _pageController;

  get getPageControllerCout => _pageControllerCout;

  void setPageController(controller) {
    _pageController = controller;
  }

  setPageContorllerCout(double pageControllerCout) {
    if (pageControllerCout > 2) {
      pageControllerCout = 2;
    }
    _pageControllerCout = pageControllerCout;
    notifyListeners();
  }
}
