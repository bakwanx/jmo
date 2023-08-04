import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:jmo/data_providers/repositories/news_repository.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';

import '../../../../data_providers/models/article_model.dart';

part 'another_news_state.dart';

class AnotherNewsCubit extends Cubit<AnotherNewsState> {
  AnotherNewsCubit() : super(AnotherNewsInitial());
  Client client = Client();
  int page = 1;

  Future<void> getAnotherNews() async {

    if(state is OnLoadingAnotherNews) return;
    final currentState = state;

    var oldNews = <ArticleModel>[];

    if (currentState is SuccessAnotherNews){
      oldNews = currentState.articleModels;
    }
    emit(OnLoadingAnotherNews(oldNews, isFirstFetch: page == 1));


    try {
      final listArticles = await NewsRepository(client).getAnotherNews(page);
      page ++;
      final articles = (state as OnLoadingAnotherNews).oldArticleModels;
      articles.addAll(listArticles);
      emit(SuccessAnotherNews(articles));
    }catch(e){
      debugPrint("${e.toString()}");
      emit(FailedAnotherNews(e.toString()));
    }

  }

  void dispose(){
    page = 1;
  }


}
