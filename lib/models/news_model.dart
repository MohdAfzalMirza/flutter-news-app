class NewsArticle {
  final String? author;
  final String title;
  final String? description;
  final String? url;
  final String? urlToImage;
  final String sourceName;
  final DateTime publishedAt;

  NewsArticle({
    this.author,
    required this.title,
    this.description,
    this.url,
    this.urlToImage,
    required this.sourceName,
    required this.publishedAt,
  });

  factory NewsArticle.fromJson(Map<String, dynamic> json) {
    return NewsArticle(
      author: json['author'],
      title: json['title'],
      description: json['description'],
      url: json['url'],
      urlToImage: json['urlToImage'],
      sourceName: json['source']['name'],
      publishedAt: DateTime.parse(json['publishedAt']),
    );
  }
}
