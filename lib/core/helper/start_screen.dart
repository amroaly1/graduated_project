import 'package:graduate_project/core/route/screen_manager.dart';
import 'package:graduate_project/core/storage/shared_preference_helper.dart';

String startSreen() {
  SharedPreferenceHelper sharedPreferenceHelper = SharedPreferenceHelper();
  if (sharedPreferenceHelper.getBool(key: SharedPreferenceKeys.isLogin) ??
      false) {
    return ScreenManager.homeView;
  } else if (sharedPreferenceHelper.getBool(
          key: SharedPreferenceKeys.onBoarding) ??
      false) {
    return ScreenManager.welcomeView;
  } else {
    return ScreenManager.onBoardingView;
  }
}
