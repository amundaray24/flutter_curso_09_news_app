import 'package:flutter/material.dart';
import 'package:flutter_curso_09_news_app/src/models/navigation_model.dart';
import 'package:flutter_curso_09_news_app/src/pages/pages.dart';
import 'package:provider/provider.dart';

class TabsPage extends StatelessWidget {
  const TabsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => NavigationModel(),
      child: const Scaffold(
        body: _Pages(),
        bottomNavigationBar: _Navigation(),
      ),
    );
  }
}

class _Navigation extends StatelessWidget {

  const _Navigation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    final navigationModel = Provider.of<NavigationModel>(context);

    return BottomNavigationBar(
      currentIndex: navigationModel.currentPage,
      onTap: (i) => navigationModel.currentPage = i,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.person_2_outlined),label: 'For you'),
        BottomNavigationBarItem(icon: Icon(Icons.public), label: 'News')
      ],
    );
  }
}

class _Pages extends StatelessWidget {
  const _Pages({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    final navigationModel = Provider.of<NavigationModel>(context);

    return PageView(
      physics: const BouncingScrollPhysics(),
      //physics: const NeverScrollableScrollPhysics(),
      controller: navigationModel.pageController,
      onPageChanged: (i) => navigationModel.currentPage = i,
      children: const [
        ForYouPage(),
        NewsPage(),
      ],
    );
  }
}
