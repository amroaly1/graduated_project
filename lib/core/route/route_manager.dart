import 'package:flutter/material.dart';
import 'package:graduate_project/core/resource/color_manager.dart';
import 'package:graduate_project/core/resource/string_manager.dart';
import 'package:graduate_project/core/resource/text_style_manager.dart';
import 'package:graduate_project/core/resource/time_manager.dart';
import 'package:graduate_project/core/route/screen_manager.dart';
import 'package:graduate_project/features/auth/reset_password/presentation/reset_password_view.dart';
import 'package:graduate_project/features/auth/confirm_email/presentation/confirm_email_view.dart';
import 'package:graduate_project/features/auth/forget_password/presentation/forget_password_view.dart';
import 'package:graduate_project/features/auth/login/presentation/login_view.dart';
import 'package:graduate_project/features/auth/signUp/presentation/sigin_up_view.dart';
import 'package:graduate_project/features/auth/welcome/presentation/welcome_view.dart';
import 'package:graduate_project/features/bridge/presentation/bridge_chat_view.dart';
import 'package:graduate_project/features/bridge/presentation/bridge_view.dart';
import 'package:graduate_project/features/chat/presentation/chat_view.dart';
import 'package:graduate_project/features/chat_with_ai/presentation/chat_with_ai_view.dart';
import 'package:graduate_project/features/chat_with_ai/presentation/intro_chat_with_ai_view.dart';
import 'package:graduate_project/features/dictionary/data/model/dictionary_item_model.dart';
import 'package:graduate_project/features/dictionary/presentation/sign_dictionary_view.dart';
import 'package:graduate_project/features/dictionary/presentation/widget/dictionary_serach_view.dart';
import 'package:graduate_project/features/dictionary/presentation/word_details_view.dart';
import 'package:graduate_project/features/home/presentation/home_view.dart';
import 'package:graduate_project/features/onboarding/view/on_boarding_view.dart';
import 'package:graduate_project/features/profile/presentation/change_password_view.dart';
import 'package:graduate_project/features/profile/presentation/edit_profile_view.dart';
import 'package:graduate_project/features/profile/presentation/profile_view.dart';
import 'package:graduate_project/features/saving/presentation/saving_view.dart';
import 'package:graduate_project/features/stream/presentation/video_to_audio_view.dart';
import 'package:graduate_project/features/stream/presentation/video_to_text_view.dart';
import 'package:graduate_project/features/upload/presentation/translate_video_view.dart';

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
      case ScreenManager.forgetPasswordView:
        return customPageBuilder(ForgetPasswordView());
      case ScreenManager.homeView:
        return customPageBuilder(HomeView());
      case ScreenManager.profileView:
        return customPageBuilder(ProfileView());
      case ScreenManager.editProfileView:
        return customPageBuilder(EditProfileView());
      case ScreenManager.changePasswordView:
        return customPageBuilder(ChangePasswordView());
      case ScreenManager.translatevideoView:
        return customPageBuilder(TranslateVideoView());
      case ScreenManager.videotoaudioview:
        return customPageBuilder(VideoToAudioView());
      case ScreenManager.videototextview:
        return customPageBuilder(VideoToTextView());
      case ScreenManager.savingView:
        return customPageBuilder(SavingView());
      case ScreenManager.chatingWitAiView:
        return customPageBuilder(ChatWithAiView());
      case ScreenManager.worddetailsview:
        return customPageBuilder(WordDetailsView(
          word: settings.arguments as DictionaryItemModel,
        ));
      case ScreenManager.chatView:
        return customPageBuilder(ChatView());
      case ScreenManager.dictionarySearchView:
        return customPageBuilder(DictionarySerachView());
      case ScreenManager.bridgeView:
        return customPageBuilder(BridgeView());
      case ScreenManager.bridgeChatView:
        return customPageBuilder(BridgeChatView());
      case ScreenManager.introChatingWitAiView:
        return customPageBuilder(IntroChatWithAiView());
      case ScreenManager.signDictionaryView:
        return customPageBuilder(SignDictionaryView());
      case ScreenManager.resetPassowrdView:
        return customPageBuilder(ResetPasswordView(
          email: settings.arguments as String,
        ));
      case ScreenManager.confirmEmail:
        return customPageBuilder(ConfirmEmailView(
          email: settings.arguments as String,
        ));
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
      // transitionDuration: Duration(milliseconds: 500),
      transitionDuration: TimeManager.mill500,
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
