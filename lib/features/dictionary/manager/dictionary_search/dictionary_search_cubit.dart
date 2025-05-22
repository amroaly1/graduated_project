import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduate_project/core/dependency_injection/di.dart';
import 'package:graduate_project/features/dictionary/data/model/dictionary_item_model.dart';
import 'package:graduate_project/features/dictionary/data/repo/dictionary_add_favorite_repo.dart';
import 'package:graduate_project/features/dictionary/data/repo/dictionary_search_repo.dart';
import 'package:graduate_project/features/dictionary/manager/sign_dictionary/sign_dictionary_cubit.dart';

part 'dictionary_search_state.dart';

class DictionarySearchCubit extends Cubit<DictionarySearchState> {
  DictionarySearchCubit({required this.favoriteRepo, required this.repo})
      : super(DictionarySearchInitial());

  static DictionarySearchCubit get(context) => BlocProvider.of(context);
  final DictionarySearchRepo repo;
  final DictionaryAddFavoriteRepo favoriteRepo;
  int dictionarySearchType = 0;
  Timer? _debounce;

  final TextEditingController searchController = TextEditingController();

  void init() {
    searchController.text = '';
    emit(DictionarySearchInitial());
  }

  void onTextFieldChange(String value) {
    if (_debounce?.isActive ?? false) {
      _debounce?.cancel();
    }
    _debounce = Timer(
      const Duration(milliseconds: 200),
      () {
        if (value.isNotEmpty) {
          search(searchTerm: value, searchType: dictionarySearchType);
        } else {
          emit(DictionarySearchInitial());
        }
      },
    );
  }

  void addFavoriteOrRemove({required int id}) async {
    var reponse = await favoriteRepo.favoriteAddOrRemove(id: id);

    reponse.fold((ifLeft) {
      emit(DictionarySearchAddFavoriteFailing(errMessage: ifLeft));
    }, (ifRight) {
      di<SignDictionaryCubit>().changeIsFavoriteItemInRepo(id);
      if (searchController.text.isNotEmpty) {
        search(
            searchTerm: searchController.text,
            searchType: dictionarySearchType);
      }
    });
  }

  void changeDictionarySearchType(int index) {
    dictionarySearchType = index;
    // do serach again using new filter
    if (searchController.text.isNotEmpty) {
      search(
          searchTerm: searchController.text, searchType: dictionarySearchType);
    } else {
      emit(DictionarySearchInitial());
    }
  }

  void search({required String searchTerm, required int searchType}) async {
    var res = await repo.search(searchTerm: searchTerm, searchType: searchType);

    res.fold((ifLeft) {
      emit(DictionarySearchError(
          errMessage: ifLeft.message,
          isFromInternet: ifLeft.problemFromInternrt));
    }, (ifRight) {
      emit(
        DictionarySearchSuccess(data: ifRight),
      );
    });
  }
}
