part of 'another_news_cubit.dart';

@immutable
abstract class AnotherNewsState {}

class AnotherNewsInitial extends AnotherNewsState {}

class OnLoadingAnotherNews extends AnotherNewsState {
  List<ArticleModel> oldArticleModels;
  final bool isFirstFetch;
  OnLoadingAnotherNews(this.oldArticleModels, {this.isFirstFetch=false});

}

class SuccessAnotherNews extends AnotherNewsState {
  List<ArticleModel> articleModels;
  SuccessAnotherNews(this.articleModels);
}

class FailedAnotherNews extends AnotherNewsState {
  String message;
  FailedAnotherNews(this.message);
}
