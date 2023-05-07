import 'dart:convert';

import 'package:flutter_curso_09_news_app/src/models/article_model.dart';

class NewsModel {

  String status;
  int totalResults;
  List<ArticleModel> articles;

  NewsModel({
    required this.status,
    required this.totalResults,
    required this.articles,
  });

  factory NewsModel.fromJson(Map<String, dynamic> json) => NewsModel(
    status: json["status"],
    totalResults: json["totalResults"],
    articles: List<ArticleModel>.from(json["articles"].map((x) => ArticleModel.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "totalResults": totalResults,
    "articles": List<dynamic>.from(articles.map((x) => x.toJson())),
  };
}