import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduate_project/features/dictionary/data/repo/sign_dictionary_repo.dart';
import 'package:graduate_project/features/dictionary/manager/cubit/sign_dictionary_state.dart';

class SignDictionaryCubit extends Cubit<SignDictionaryState> {
  SignDictionaryCubit({required this.repo}) : super(SignDictionaryInitial());

  static SignDictionaryCubit get(context) => BlocProvider.of(context);

  final SignDictionaryRepo repo;
  TextEditingController controller = TextEditingController();
  ScrollController controllerScroll = ScrollController();

  bool isFirst = true;

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
      emit(SignDictionaryGetAllDataSuccess(
          data: ifRight.data, canLoadMore: ifRight.canLoading));

      isFirst = false;
    });
  }
}
