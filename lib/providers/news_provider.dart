import 'package:flutter/material.dart';
import 'package:news_app/services/news_api_servie.dart';

class NewsProvider with ChangeNotifier {
  final NewsService _newsService = NewsService();
  List<dynamic> _articles = [];
  bool _isLoading = false;

  List<dynamic> get articles => _articles;
  bool get isLoading => _isLoading;

  Future<void> fetchNews(String country) async {
    _isLoading = true;
    notifyListeners();
    
    try {
      _articles = await _newsService.fetchTopHeadlines(country: country);
    } catch (e) {
      print('Error fetching news: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
