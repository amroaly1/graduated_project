import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduate_project/features/signGPT/data/model/search_model.dart';
import 'package:graduate_project/features/signGPT/data/repo/get_search_chat_repo.dart';

// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

part 'search_chat_state.dart';

class SearchChatCubit extends Cubit<SearchChatState> {
  SearchChatCubit(this.repo) : super(SearchChatInitial());

  static SearchChatCubit get(context) => BlocProvider.of(context);

  final GetSearchChatRepo repo;

  void search({
    required String word,
  }) async {
    emit(SearchChatLoading());
    var res = await repo.getSearchResult(word: word);
    res.fold((ifLeft) {
      emit(SearchChatError(errMessage: ifLeft));
    }, (ifRight) {
      log("Get Data");
      emit(SearchChatSuccess(data: ifRight));
    });
  }
}
