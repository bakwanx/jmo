import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:meta/meta.dart';

import '../../../../data_providers/models/article_model.dart';
import '../../../../data_providers/repositories/news_repository.dart';

part 'new_news_state.dart';

class NewNewsCubit extends Cubit<NewNewsState> {
  NewNewsCubit() : super(NewNewsInitial());

  Client client = Client();

  Future<void> getNewNews() async {
    emit(OnLoadingNewNews());
    try {
      final listArticles = await NewsRepository(client).getNewNews();
      emit(SuccessNewNews(listArticles));
    }catch(e){
      debugPrint(e.toString());
      emit(FailedNewNews(e.toString()));
    }
  }
}
