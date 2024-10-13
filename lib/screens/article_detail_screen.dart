import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/news_model.dart';

class ArticleDetailsScreen extends StatelessWidget {
  final NewsArticle article;

  ArticleDetailsScreen({required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(article.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image with placeholder
            ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: article.urlToImage != null
                  ? Image.network(
                article.urlToImage!,
                height: 250,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Image.asset(
                    'assets/placeholder-news.png',
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  );
                },
              )
                  : Image.asset(
                'assets/placeholder-news.png',
                height: 250,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 10),
            Text(article.title, style: const TextStyle(fontSize: 24)),
            const SizedBox(height: 10),
            Text('By ${article.author ?? 'Unknown'} - ${article.sourceName}'),
            const SizedBox(height: 10),
            Text(article.description ?? ''),
            const Spacer(),
            if (article.url != null && article.url!.isNotEmpty) ...[
              ElevatedButton(
                onPressed: () {
                  if (article.url != null) {
                    _openArticleInBrowser(article.url!);
                  }
                },
                child: const Text('Read Full Article'),
              ),
            ],
          ],
        ),
      ),
    );
  }

  void _openArticleInBrowser(String url) async {
    final Uri articleUrl = Uri.parse(url);

    if (await canLaunchUrl(articleUrl)) {
      await launchUrl(articleUrl, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }
}
