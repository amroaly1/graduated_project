import 'package:flutter/material.dart';
import 'package:graduate_project/core/resource/color_manager.dart';
import 'package:graduate_project/core/resource/string_manager.dart';
import 'package:graduate_project/core/resource/text_style_manager.dart';
import 'package:graduate_project/core/resource/time_manager.dart';
import 'package:graduate_project/core/route/screen_manager.dart';
import 'package:graduate_project/features/auth/login/presentation/login_view.dart';
import 'package:graduate_project/features/auth/signUp/presentation/sigin_up_view.dart';
import 'package:graduate_project/features/auth/welcome/presentation/welcome_view.dart';
import 'package:graduate_project/features/onboarding/view/on_boarding_view.dart';

abstract class RouteManager {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case ScreenManager.onBoardingView:
        return customPageBuilder(OnBoardingView());

      case ScreenManager.welcomeView:
        return customPageBuilder(WelcomeView());
      case ScreenManager.loginView:
        return customPageBuilder(LoginView());
      case ScreenManager.siginUpView:
        return customPageBuilder(SiginUpView());
      default:
        return customPageBuilder(
          Scaffold(
            body: Text(
              StringManager.noPage,
              style: TextStyleManager.black32(color: ColorManager.red),
            ),
          ),
        );
    }
  }

  static PageRouteBuilder<dynamic> customPageBuilder(Widget screen) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => screen,
      transitionDuration: TimeManager.mill250,
      transitionsBuilder: (_, animation, __, child) {
        return FadeTransition(
          opacity: animation,
          child: SlideTransition(
            position: Tween<Offset>(
              begin: Offset(-1.0, 0.0),
              end: Offset.zero,
            ).animate(
              animation,
            ),
            child: child,
          ),
        );
      },
    );
  }
}
