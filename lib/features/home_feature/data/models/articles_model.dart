import '../../domain/entities/articles.dart';

class ArticlesModel extends Articles {
  const ArticlesModel({
    required super.author,
    required super.description,
    required super.publishedAt,
    required super.title,
    required super.url,
    required super.urlToImage,
  });

  factory ArticlesModel.fromMap(Map<String, dynamic> json) {
    return ArticlesModel(
      author: json['author'],
      description: json['description'],
      publishedAt: json['publishedAt'],
      title: json['title'],
      url: json['url'],
      urlToImage: json['urlToImage'],
    );
  }
}
