import 'package:flutter/material.dart';

class NavigationModel extends ChangeNotifier {

  int _currentPage = 0;
  final PageController _pageController = PageController(
    initialPage: 0
  );

  int get currentPage => _currentPage;

  set currentPage (int page) {
    _currentPage = page;
    _pageController.animateToPage(
      page,
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeOutSine
    );
    notifyListeners();
  }

  PageController get pageController => _pageController;
}