import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/news_provider.dart';
import '../widgets/news_item_card.dart';
import '../widgets/loading_indicator.dart';

class HomeScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final newsAsyncValue = ref.watch(newsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Top Headlines'),
      ),
      body: RefreshIndicator(
        onRefresh: () async => ref.refresh(newsProvider),
        child: newsAsyncValue.when(
          data: (articles) => ListView.builder(
            itemCount: articles.length,
            itemBuilder: (context, index) {
              return NewsItemCard(article: articles[index]);
            },
          ),
          loading: () => LoadingIndicator(),
          error: (error, stackTrace) => Center(
            child: Text('Error: $error'),
          ),
        ),
      ),
    );
  }
}
