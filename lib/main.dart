import 'package:flutter/material.dart';
import 'package:flutter_curso_09_news_app/src/pages/pages.dart';
import 'package:flutter_curso_09_news_app/src/services/services.dart';
import 'package:flutter_curso_09_news_app/src/theme/dark_theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NewsService())
      ],
      child: MaterialApp(
        title: 'Course News',
        debugShowCheckedModeBanner: false,
        theme: darkTheme,
        home: const TabsPage(),
      ),
    );
  }
}
