import 'package:flutter/material.dart';
import 'package:flutter_curso_09_news_app/src/models/models.dart';
import 'package:flutter_curso_09_news_app/src/services/services.dart';
import 'package:flutter_curso_09_news_app/src/theme/dark_theme.dart';
import 'package:flutter_curso_09_news_app/src/widgets/news_list_widget.dart';
import 'package:provider/provider.dart';

class NewsPage extends StatelessWidget {

  const NewsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final NewsService newsService = Provider.of<NewsService>(context);

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const _CategoriesList(),
            Expanded(
              child: (newsService.isLoading)
                ? Center(child: CircularProgressIndicator(color: darkTheme.colorScheme.secondary),)
                : NewsListWidget(news: newsService.getArticlesSelectedCategory,)
            )
          ],
        ),
      ),
    );
  }
}

class _CategoriesList extends StatelessWidget {
  const _CategoriesList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    final NewsService newsService = Provider.of<NewsService>(context);

    return SizedBox(
      width: double.infinity,
      height: 80,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: newsService.categories.length,
        itemBuilder: (_,index) {
          return Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                _CategoryButton(category: newsService.categories[index]),
                const SizedBox(height: 5),
                Text(newsService.categories[index].name,
                  style: TextStyle(color: newsService.selectedCategory == newsService.categories[index].id ? darkTheme.colorScheme.secondary : Colors.white),
                )
              ],
            ),
          );
        }
      ),
    );
  }
}

class _CategoryButton extends StatelessWidget {

  const _CategoryButton({
    super.key,
    required this.category,
  });

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {

    final NewsService newsService = Provider.of<NewsService>(context);

    return GestureDetector(
      onTap: () {
        newsService.selectedCategory = category.id;
      },
      child: Container(
        width: 40,
        height: 40,
        margin: const EdgeInsets.symmetric(horizontal: 10),
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white
        ),
        child: Icon(
          category.icon,
          color: newsService.selectedCategory == category.id ? darkTheme.colorScheme.secondary : Colors.black54,
        ),
      ),
    );
  }
}
