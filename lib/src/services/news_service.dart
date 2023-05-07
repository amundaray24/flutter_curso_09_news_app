import 'package:flutter/material.dart';
import 'package:flutter_curso_09_news_app/src/models/models.dart';
import 'package:flutter_curso_09_news_app/src/services/base_service.dart';

class NewsService extends BaseService with ChangeNotifier {

  final String _baseUrl = const String.fromEnvironment('API_NEWS_BASE_URL') ?? '';
  final String _country = WidgetsBinding.instance.window.locale.countryCode ?? 'us';

  List<ArticleModel> headLines = [];
  String _selectedCategory = 'general';
  Map<String,List<ArticleModel>> categoryArticles = {};
  bool _isLoading = false;

  List<CategoryModel> categories = [
    CategoryModel(id: 'general', icon: Icons.all_inclusive, name: 'General'),
    CategoryModel(id: 'business', icon: Icons.business_center_sharp, name: 'Business'),
    CategoryModel(id: 'entertainment', icon: Icons.tv, name: 'Entertainment'),
    CategoryModel(id: 'health', icon: Icons.biotech, name: 'Health'),
    CategoryModel(id: 'science', icon: Icons.science, name: 'Science'),
    CategoryModel(id: 'sports', icon: Icons.sports_baseball, name: 'Sports'),
    CategoryModel(id: 'technology', icon: Icons.computer, name: 'Technology')
  ];

  NewsService() {

    initHeadLines();

    for (var element in categories) {
      categoryArticles[element.id] = [];
    }

    getArticlesByCategory(_selectedCategory);
  }

  String get selectedCategory => _selectedCategory;

  set selectedCategory(String category) {
    _selectedCategory = category;
    getArticlesByCategory(category);
    notifyListeners();
  }

  List<ArticleModel> get getArticlesSelectedCategory => categoryArticles[selectedCategory]!;

  bool get isLoading => _isLoading;

  initHeadLines() async {
    _dispatchLoading(true);
    final Map<String,dynamic> response = await getJsonData(_baseUrl, '/v2/top-headlines', queryParams: {'country': _country.toLowerCase()});
    headLines.addAll(NewsModel.fromJson(response).articles);
    _dispatchLoading(false);
  }

  getArticlesByCategory(String category) async {

    _dispatchLoading(true);

    if (categoryArticles[category]!.isNotEmpty) {
      _dispatchLoading(false);
      return categoryArticles[category];
    }

    final Map<String,dynamic> response = await getJsonData(_baseUrl, '/v2/top-headlines', queryParams: {'country': _country.toLowerCase(),'category': category});
    categoryArticles[category]!.addAll(NewsModel.fromJson(response).articles);

    _dispatchLoading(false);
  }

  _dispatchLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

}