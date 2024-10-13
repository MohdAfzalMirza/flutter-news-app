import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../services/news_api_service.dart';
import '../models/news_model.dart';

final newsProvider = FutureProvider<List<NewsArticle>>((ref) async {
  return await NewsApiService().fetchTopHeadlines();
});
