import 'package:flutter/material.dart';
import 'package:flutter_curso_09_news_app/src/models/models.dart';
import 'package:flutter_curso_09_news_app/src/theme/dark_theme.dart';

class NewsListWidget extends StatelessWidget {

  final List<ArticleModel> news;

  const NewsListWidget({
    Key? key,
    required this.news
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: news.length,
      itemBuilder: (_,index) {
        return _News(article: news[index], index: index,);
      }
    );
  }
}

class _News extends StatelessWidget {

  const _News({
    super.key,
    required this.article,
    required this.index
  });

  final ArticleModel article;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _TopBarCard(article: article, index: index),
        _TitleCard(article: article),
        _ImageCard(article: article),
        _BodyCard(article: article),
        const SizedBox(height: 10,),
        const Divider(),
        const _ButtonsCard()
      ],
    );
  }
}

class _TopBarCard extends StatelessWidget {

  const _TopBarCard({
    super.key,
    required this.article,
    required this.index
  });

  final ArticleModel article;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      margin: const EdgeInsets.only(bottom: 0),
      child: Row(
        children: [
          Text('${index + 1}. ', style: TextStyle(color: darkTheme.colorScheme.secondary),),
          Text('${article.source!.name}. '),
        ],
      ),
    );
  }
}

class _TitleCard extends StatelessWidget {

  const _TitleCard({
    super.key,
    required this.article,
  });

  final ArticleModel article;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Text(article.title!, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),),
    );
  }
}

class _ImageCard extends StatelessWidget {

  const _ImageCard({
    super.key,
    required this.article,
  });

  final ArticleModel article;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(topLeft: Radius.circular(50), bottomRight: Radius.circular(50)),
        child: Container(
            child: article.urlToImage !=null
                ? FadeInImage(
              placeholder: const AssetImage('assets/giphy.gif'),
              image: NetworkImage(article.urlToImage!),
            )
                : const Image(image: AssetImage('assets/no-image.png'))
        ),
      ),
    );
  }
}

class _BodyCard extends StatelessWidget {
  const _BodyCard({
    super.key,
    required this.article,
  });

  final ArticleModel article;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Text(article.description ?? '')
    );
  }
}


class _ButtonsCard extends StatelessWidget {
  const _ButtonsCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RawMaterialButton(
            onPressed: (){},
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            fillColor: darkTheme.colorScheme.secondary,
            child: const Icon(Icons.star_border_outlined),
          ),
          const SizedBox(width: 10,),
          RawMaterialButton(
            onPressed: (){},
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            fillColor: Colors.blue,
            child: const Icon(Icons.more),
          ),
        ],
      ),
    );
  }
}