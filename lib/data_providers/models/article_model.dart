class ArticleModel {
  String? author;
  String title;
  String description;
  String? urlToImage;
  DateTime publishedAt;
  String content;

  ArticleModel({
    this.author,
    required this.title,
    required this.description,
    this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  factory ArticleModel.fromJson(Map<String, dynamic> json) => ArticleModel(
    author: json["author"],
    title: json["title"],
    description: json["description"],
    urlToImage: json["urlToImage"],
    publishedAt: DateTime.parse(json["publishedAt"]),
    content: json["content"],
  );

  Map<String, dynamic> toJson() => {
    "author": author,
    "title": title,
    "description": description,
    "urlToImage": urlToImage,
    "publishedAt": publishedAt.toIso8601String(),
    "content": content,
  };
}