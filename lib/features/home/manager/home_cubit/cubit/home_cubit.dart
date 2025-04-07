import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduate_project/features/home/manager/home_cubit/cubit/home_state.dart';
import 'package:graduate_project/features/dictionary/presentation/sign_dictionary_body.dart';
import 'package:graduate_project/features/stream/presentation/stream_body.dart';
import 'package:graduate_project/features/upload/presentation/upload_body.dart';
import 'package:graduate_project/features/home/presentation/widget/home_body.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  static HomeCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;

  void chnageCurrentIndex(int index) {
    currentIndex = index;
    emit(HomeChangeCurrentIndex());
  }

  List<Widget> screens = [
    HomeBody(),
    UploadBody(),
    StreamBody(),
    // ChatBody(),
    SignDictionaryBody(),
  ];

  Widget myBody() {
    return screens[currentIndex];
  }
}
