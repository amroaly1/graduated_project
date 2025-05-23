import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduate_project/features/dictionary/data/model/map_of_character.dart';
import 'package:graduate_project/features/dictionary/data/repo/sign_dictionary_repo.dart';
import 'package:graduate_project/features/dictionary/manager/sign_dictionary/sign_dictionary_state.dart';

class SignDictionaryCubit extends Cubit<SignDictionaryState> {
  SignDictionaryCubit({required this.repo}) : super(SignDictionaryInitial());

  static SignDictionaryCubit get(context) => BlocProvider.of(context);

  final SignDictionaryRepo repo;
  TextEditingController controller = TextEditingController();
  ScrollController controllerScroll = ScrollController();

  bool isFirst = true;
  List<MapOfCharacter> data = [];
  bool canLoadMore = true;

  void onchange(String? value) {
    if (value != null && value.isNotEmpty) {
    } else {}
  }

  void inital() {
    controllerScroll.addListener(() {
      if (controllerScroll.position.atEdge) {
        if (controllerScroll.position.pixels ==
            controllerScroll.position.maxScrollExtent) {
          getData();
        }
      }
    });

    getData();
  }

  void getData() async {
    isFirst == true ? emit(SignDictionaryGetAllDataLoading()) : null;

    var response = await repo.getData();
    response.fold((ifLeft) {
      isFirst == true
          ? emit(SignDictionaryGetAllDataFirstFailing(
              fromInternet: ifLeft.problemFromInternrt,
              errorMessage: ifLeft.message))
          : emit(SignDictionaryGetAllDataFailing(errorMessage: ifLeft.message));
    }, (ifRight) {
      data = ifRight.data;
      canLoadMore = ifRight.canLoading;
      emit(SignDictionaryGetAllDataSuccess());

      isFirst = false;
    });
  }

  void changeFavoriteOfItem(int id) async {
/*************  ✨ Windsurf Command ⭐  *************/
    /// This function is used to change the favorite of the item that has the given id
    /// It emits [SignDictionaryGetAllDataFailing] if there is an error,
    /// otherwise it emits [SignDictionaryGetAllDataSuccess] with the data and canLoadMore
    /// after changing the favorite of the item in the repo
/*******  73fab4a9-dba0-4b27-bdb9-f50b6a179e2d  *******/ var reponse =
        await repo.addOrRemoveFavorite(id: id);

    reponse.fold((ifLeft) {
      emit(SignDictionaryGetAllDataFailing(errorMessage: ifLeft));
    }, (right) {
      changeIsFavoriteItemInRepo(id);
    });
  }

  void changeIsFavoriteItemInRepo(int id) {
    var response = repo.changeIsFaoriteData(id: id);

    data = response.data;
    canLoadMore = response.canLoading;
    emit(SignDictionaryGetAllDataSuccess());
  }
}
