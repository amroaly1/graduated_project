import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduate_project/features/dictionary/data/model/word_model.dart';
import 'package:graduate_project/features/dictionary/data/repo/sign_dictionary_repo.dart';
import 'package:graduate_project/features/dictionary/manager/cubit/sign_dictionary_state.dart';

class SignDictionaryCubit extends Cubit<SignDictionaryState> {
  SignDictionaryCubit() : super(SignDictionaryInitial());

  static SignDictionaryCubit get(context) => BlocProvider.of(context);

  SignDictionaryRepo repo = SignDictionaryRepo();
  TextEditingController controller = TextEditingController();
  List<WordModel> searchData = [];

  void saveElement() {
    if (searchData.isNotEmpty) {
      search(controller.text);
    } else {
      emit(SignDictionarySaveEmelemt());
    }
  }

  void onchange(String? value) {
    if (value != null && value.isNotEmpty) {
      search(value);
    } else {
      searchData = [];
      emit(SignDictionaryNotSearch());
    }
  }

  void search(String value) {
    searchData = [];
    for (var element in repo.data) {
      for (int i = 0; i < element.words.length; i++) {
        if (element.words[i].word.toUpperCase().contains(value.toUpperCase())) {
          searchData.add(element.words[i]);
        }
      }
    }
    if (searchData.isNotEmpty) {
      emit(SignDictionarySearch());
    } else {
      emit(SignDictionaryNotSearch());
    }
  }
}
