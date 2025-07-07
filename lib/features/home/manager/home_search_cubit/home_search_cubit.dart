import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduate_project/features/home/data/model/search_model.dart';
import 'package:graduate_project/features/home/data/repo/home_search_repo.dart';
import 'package:meta/meta.dart';

part 'home_search_state.dart';

class HomeSearchCubit extends Cubit<HomeSearchState> {
  HomeSearchCubit(this.repo) : super(HomeSearchInitial());

  static HomeSearchCubit get(context) => BlocProvider.of(context);

  final HomeSearchRepo repo;

  late SearchModel searchModel;

  void getSearchResult(String word) async {
    emit(HomeSearchLoadingState());
    var result = await repo.getSearchResult(word);
    result.fold((l) => emit(HomeSearchErrorState(errMessage: l)), (r) {
      searchModel = r;
      log(searchModel.translations.toString());
      emit(HomeSearchSuccessState());
    });
  }
}
