import 'package:dio/dio.dart';

class NewsService {
  final Dio _dio = Dio();
  final String apiKey = '2e189d77280643438611b79a45910c8b';
  final String baseUrl = 'https://newsapi.org/v2/top-headlines';

  Future<List<dynamic>> fetchTopHeadlines({required String country, String category = 'business'}) async {
    try {
      final response = await _dio.get(baseUrl, queryParameters: {
        'country': country,
        'category': category,
        'apiKey': apiKey,
      });

      if (response.statusCode == 200) {
        return response.data['articles']; // Assuming 'articles' is the key for news list.
      } else {
        throw Exception('Failed to load news');
      }
    } on DioException catch (e) {
      throw Exception('Failed to load news: ${e.message}');
    }
  }
}
