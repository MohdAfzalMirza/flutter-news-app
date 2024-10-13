import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/news_model.dart';

class NewsApiService {
  static const _apiKey = '76938ecef02743bcb28b6befb86a7f69';
  static const _url = 'https://newsapi.org/v2/top-headlines?country=us&apiKey=$_apiKey';

  Future<List<NewsArticle>> fetchTopHeadlines() async {
    final response = await http.get(Uri.parse(_url));

    if (response.statusCode == 200) {
      final List articles = json.decode(response.body)['articles'];
      return articles.map((article) => NewsArticle.fromJson(article)).toList();
    } else {
      throw Exception('Failed to load news');
    }
  }
}
