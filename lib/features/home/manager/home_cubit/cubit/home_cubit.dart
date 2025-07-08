import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduate_project/features/bridge/presentation/widget/bridge_body_view.dart';
import 'package:graduate_project/features/translate/presentation/widget/chat_body.dart';
import 'package:graduate_project/features/chat_with_ai/presentation/widget/intro_chat_with_ai_body_view.dart';
import 'package:graduate_project/features/home/manager/home_cubit/cubit/home_state.dart';
import 'package:graduate_project/features/profile/presentation/widget/profile_body_view.dart';
import 'package:graduate_project/features/upload/presentation/upload_body.dart';
import 'package:graduate_project/features/home/presentation/widget/home_body.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  static HomeCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  bool isShowBottomNavigationBar = true;

  void chnageCurrentIndex(int index) {
    currentIndex = index;
    emit(HomeChangeCurrentIndex());
  }

  void onVerticalDragUpdate(DragUpdateDetails details) {
    final double sensitivity = 3; // minimum movement threshold

    if (details.delta.dy > sensitivity) {
      if (isShowBottomNavigationBar) {
        isShowBottomNavigationBar = false;
        emit(HomeIsShowBottomNavigationBar());
      }
    } else if (details.delta.dy < -sensitivity) {
      if (!isShowBottomNavigationBar) {
        isShowBottomNavigationBar = true;
        emit(HomeIsShowBottomNavigationBar());
      }
    }
  }

  List<Widget> screens = [
    HomeBody(),
    BridgeBodyView(),
    // BridgeChatBodyView(),
    IntroChatWithAiBodyView(),
    // ChatWitAiBodyView(),
    UploadBody(),
    ChatBody(),
    ProfileBodyView(),
  ];

  Widget myBody() {
    return screens[currentIndex];
  }
}
