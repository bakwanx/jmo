part of 'new_news_cubit.dart';

@immutable
abstract class NewNewsState {}

class NewNewsInitial extends NewNewsState {}

class OnLoadingNewNews extends NewNewsState {}

class SuccessNewNews extends NewNewsState {
  List<ArticleModel> articleModels;
  SuccessNewNews(this.articleModels);
}

class FailedNewNews extends NewNewsState {
  String message;
  FailedNewNews(this.message);
}