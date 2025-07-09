import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduate_project/core/resource/animation_manager.dart';
import 'package:graduate_project/core/resource/time_manager.dart';
import 'package:graduate_project/core/route/navigation_manager.dart';
import 'package:graduate_project/core/route/screen_manager.dart';
import 'package:graduate_project/core/storage/shared_preference_helper.dart';
import 'package:graduate_project/features/onboarding/data/repo/on_boarding_repo.dart';
import 'package:graduate_project/features/onboarding/manager/on_boarding_cubit/on_boarding_state.dart';

class OnBoardingCubit extends Cubit<OnBoardingState> {
  OnBoardingCubit() : super(OnBoardingInit());

  static OnBoardingCubit get(context) => BlocProvider.of(context);

  // repo
  OnBoardingRepo repo = OnBoardingRepo();

  // page view controller
  PageController controller = PageController();

  int currentIndex = 0;
  late bool isOut;

  void init() {
    isOut = false;
    emit(OnBoardingInit());
    Timer(Duration(milliseconds: 250), () {
      isOut = true;
      if (!isClosed) {
        emit(OnBoardingAnimation());
      }
    });
  }

  void onPageChange(int index) {
    currentIndex = index;
  }

  bool buttonVisisble() {
    return (currentIndex == repo.list.length - 1);
  }

  bool arrowBackVisisble() {
    return (currentIndex != 0);
  }

  bool arrowForwardVisisble() {
    return (currentIndex != repo.list.length - 1);
  }

  bool skipVisibility() {
    return (currentIndex != repo.list.length - 1);
  }

  void goToNextPage() {
    int nextindex = ++currentIndex;
    if (nextindex <= repo.list.length) {
      animated();
      controller.animateToPage(
        nextindex,
        duration: TimeManager.mill250,
        curve: AnimationManager.bounceInOut,
      );
    }
  }

  void animated() {
    isOut = false;
    Timer(Duration(milliseconds: 250), () {
      isOut = true;
      if (!isClosed) {
        emit(OnBoardingAnimation());
      }
    });
  }

  void goToPrevPage() {
    int prevIndex = --currentIndex;
    if (prevIndex != -1) {
      animated();
      controller.animateToPage(
        prevIndex,
        duration: TimeManager.mill250,
        curve: AnimationManager.bounceInOut,
      );
    }
  }

  void navigatToWelcomeView(BuildContext context) {
    SharedPreferenceHelper sharedPreferenceHelper = SharedPreferenceHelper();
    sharedPreferenceHelper.saveData(
        key: SharedPreferenceKeys.onBoarding, value: true);
    NavigationManager.pushReplace(
        context: context, screen: ScreenManager.welcomeView);
  }
}
