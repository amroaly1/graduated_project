import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduate_project/core/dependency_injection/di.dart';
import 'package:graduate_project/features/dictionary/data/repo/dictionary_add_favorite_repo.dart';
import 'package:graduate_project/features/saving/data/model/dictionary_saving_model.dart';
import 'package:graduate_project/features/saving/data/repo/dicationry_saving_repo.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

part 'dictionary_saving_state.dart';

class DictionarySavingCubit extends Cubit<DictionarySavingState> {
  DictionarySavingCubit(this.repo) : super(DictionarySavingInitial());

  static DictionarySavingCubit get(context) => BlocProvider.of(context);

  List<DictionarySavingModel> list = [];

  final DicationrySavingRepo repo;

  void init() {
    if (list.isEmpty) {
      getAllData();
    }
  }

  void getAllData() async {
    emit(DictionarySavingLoading());
    var result = await repo.getSavingDictionary();
    result.fold((l) => emit(DictionarySavingFailing(errMessage: l)), (r) {
      list = r;
      emit(DictionarySavingSuccess());
    });
  }

  void deleteItem({required int id}) async {
    var result =
        await di<DictionaryAddFavoriteRepo>().favoriteAddOrRemove(id: id);
    result.fold((l) => emit(DictionarySavingDeleteFailing(errMessage: l)), (r) {
      list.removeWhere((element) => element.dictionaryEntryId == id);
      log("Delete Success");
      log("${list.length}");
      emit(DictionarySavingDeleteSuccess());
    });
  }
}
