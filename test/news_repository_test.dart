import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:jmo/data_providers/models/article_model.dart';
import 'package:jmo/data_providers/repositories/news_repository.dart';
import 'package:jmo/utils/constant/url_path.dart';
import 'package:mocktail/mocktail.dart';

class MockHTTPClient extends Mock implements Client {}

void main() {
  late NewsRepository newsRepository;
  late MockHTTPClient mockHTTPClient;
  List<Map<String, dynamic>> articleResponse = [];

  var dummyArticleModels = [
    ArticleModel(
        author: "test",
        title: "test",
        description: "test",
        publishedAt: DateTime.now(),
        content: "test",
        urlToImage: "test"),
    ArticleModel(
        author: "test",
        title: "test",
        description: "test",
        publishedAt: DateTime.now(),
        content: "test",
        urlToImage: "test"),
    ArticleModel(
        author: "test",
        title: "test",
        description: "test",
        publishedAt: DateTime.now(),
        content: "test",
        urlToImage: "test"),
    ArticleModel(
        author: "test",
        title: "test",
        description: "test",
        publishedAt: DateTime.now(),
        content: "test",
        urlToImage: "test"),
    ArticleModel(
        author: "test",
        title: "test",
        description: "test",
        publishedAt: DateTime.now(),
        content: "test",
        urlToImage: "test"),
  ];

  setUp(() {
    mockHTTPClient = MockHTTPClient();
    newsRepository = NewsRepository(mockHTTPClient);


    articleResponse = dummyArticleModels
        .map((data) => ArticleModel(
              author: data.author,
              title: data.title,
              description: data.description,
              publishedAt: data.publishedAt,
              content: data.content,
              urlToImage: data.urlToImage,
            ).toJson())
        .toList();
  });

  group("News Repository Test", () {
    test(
      'getAnotherNews server internal error test',
      () async {
        registerFallbackValue(Uri());
        // Arrange
        when(
          () => mockHTTPClient.get(
            any(),
          ),
        ).thenAnswer((invocation) async {
          return Response(
            jsonEncode({"articles": articleResponse}),
            500,
          );
        });

        final articleModel = await newsRepository.getAnotherNews(5, 1);

        expect(articleModel, throwsException);
        expect(5, articleModel.length);
      },
    );

    test(
      'getAnotherNews test',
          () async {
        registerFallbackValue(Uri());
        // Arrange
        when(
              () => mockHTTPClient.get(
            any(),
          ),
        ).thenAnswer((invocation) async {
          return Response(
            jsonEncode({"articles": articleResponse}),
            200,
          );
        });

        // //result
        final articleModel = await newsRepository.getAnotherNews(5, 1);

        expect(articleModel, isA<List<ArticleModel>>());
        expect(5, articleModel.length);
      },
    );

    test(
      'getNewNews test',
          () async {
        registerFallbackValue(Uri());
        // Arrange
        when(
              () => mockHTTPClient.get(
            any(),
          ),
        ).thenAnswer((invocation) async {
          return Response(
            jsonEncode({"articles": articleResponse}),
            200,
          );
        });

        // //result
        final articleModel = await newsRepository.getNewNews();

        expect(articleModel, isA<List<ArticleModel>>());
        expect(5, articleModel.length);
      },
    );
  });
}
