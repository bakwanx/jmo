import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:jmo/data_providers/models/article_model.dart';
import 'package:jmo/utils/constant/url_path.dart';

class NewsRepository {
  final http.Client client;
  NewsRepository(this.client);

  Future<List<ArticleModel>> getAnotherNews(int pageSize, int page) async {
    final response = await client.get(
      uriAnotherNews(pageSize, page),
    );
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final listArticles = data["articles"].map<ArticleModel>((d) => ArticleModel.fromJson(d)).toList();
      return listArticles;
    }
    throw Exception('Some Error Occurred');
  }

  Future<List<ArticleModel>> getNewNews() async {
    final response = await client.get(
      uriNewNews(),
    );
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      final listArticles = data["articles"].map<ArticleModel>((d) => ArticleModel.fromJson(d)).toList();
      return listArticles;
    }
    throw Exception('Some Error Occurred');
  }
}