import 'package:flutter/material.dart';
import 'package:flutter_curso_09_news_app/src/services/services.dart';
import 'package:flutter_curso_09_news_app/src/theme/dark_theme.dart';
import 'package:flutter_curso_09_news_app/src/widgets/news_list_widget.dart';
import 'package:provider/provider.dart';

class ForYouPage extends StatefulWidget {

  const ForYouPage({Key? key}) : super(key: key);

  @override
  State<ForYouPage> createState() => _ForYouPageState();
}

class _ForYouPageState extends State<ForYouPage> with AutomaticKeepAliveClientMixin {

  @override
  Widget build(BuildContext context) {

    super.build(context);

    final newsService = Provider.of<NewsService>(context);

    return Scaffold(
      body: (newsService.isLoading)
      ? Center(child: CircularProgressIndicator(color: darkTheme.colorScheme.secondary),)
      : NewsListWidget(news: newsService.headLines,),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
