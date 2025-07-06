import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:graduate_project/core/helper/connect_internet_helper.dart';
import 'package:graduate_project/core/network/api_helper.dart';
import 'package:graduate_project/features/auth/reset_password/data/repo/reset_password_repo.dart';
import 'package:graduate_project/features/auth/reset_password/manager/cubit/reset_password_cubit.dart';
import 'package:graduate_project/features/auth/confirm_email/data/repo/confirm_email_repo.dart';
import 'package:graduate_project/features/auth/confirm_email/manager/cubit/confirm_email_cubit.dart';
import 'package:graduate_project/features/auth/forget_password/data/repo/forget_password_repo.dart';
import 'package:graduate_project/features/auth/forget_password/manager/cubit/forget_password_cubit.dart';
import 'package:graduate_project/features/auth/login/data/repo/login_repo.dart';
import 'package:graduate_project/features/auth/login/manager/cubit/login_cubit.dart';
import 'package:graduate_project/features/auth/signUp/data/repo/sigin_up_repo.dart';
import 'package:graduate_project/features/auth/signUp/manager/cubit/sigin_up_cubit.dart';
import 'package:graduate_project/features/chat/data/repo/chat_repo.dart';
import 'package:graduate_project/features/chat/manager/chat_cubit/chat_cubit.dart';
import 'package:graduate_project/core/manager/mic_cubit/mic_cubit.dart';
import 'package:graduate_project/features/dictionary/data/repo/dictionary_add_favorite_repo.dart';
import 'package:graduate_project/features/dictionary/data/repo/dictionary_search_repo.dart';
import 'package:graduate_project/features/dictionary/data/repo/dictionary_word_repo.dart';
import 'package:graduate_project/features/dictionary/data/repo/sign_dictionary_repo.dart';
import 'package:graduate_project/features/dictionary/manager/dictionary_search/dictionary_search_cubit.dart';
import 'package:graduate_project/core/manager/manage_user_data/manager_user_data_cubit.dart';
import 'package:graduate_project/features/dictionary/manager/sign_dictionary/sign_dictionary_cubit.dart';
import 'package:graduate_project/features/home/data/repo/home_dictionar_repo.dart';
import 'package:graduate_project/features/home/manager/home_cubit/cubit/home_cubit.dart';
import 'package:graduate_project/features/home/manager/home_dictionary/home_dictionary_cubit.dart';
import 'package:graduate_project/features/profile/data/repo/change_password_repo.dart';
import 'package:graduate_project/features/profile/data/repo/edit_profile_repo.dart';
import 'package:graduate_project/features/profile/manager/change_image_cubit/change_image_cubit.dart';
import 'package:graduate_project/features/profile/manager/change_password.dart/change_password_cubit.dart';
import 'package:graduate_project/features/profile/manager/edit_profile_cubit/edit_profile_cubit.dart';
import 'package:graduate_project/features/saving/data/repo/dicationry_saving_repo.dart';
import 'package:graduate_project/features/saving/data/repo/get_all_data_saving_repo.dart';
import 'package:graduate_project/features/saving/data/repo/trasnlation_saving_repo.dart';
import 'package:graduate_project/features/saving/data/repo/video_to_audio_save_repo.dart';
import 'package:graduate_project/features/saving/data/repo/video_to_text_save_repo.dart';
import 'package:graduate_project/features/saving/manager/cubit/get_all_data_saving_cubit.dart';
import 'package:graduate_project/features/saving/manager/dictionary_saving_cubit/dictionary_saving_cubit.dart';
import 'package:graduate_project/features/saving/manager/saving_cubit/saving_cubit.dart';
import 'package:graduate_project/features/saving/manager/translation_saving/trsanlation_saving_cubit.dart';
import 'package:graduate_project/features/saving/manager/video_to_audio_save/video_to_audio_save_cubit.dart';
import 'package:graduate_project/features/saving/manager/video_to_text_cubit/video_to_text_cubitt.dart';
import 'package:graduate_project/features/upload/data/repo/saving_video_repo.dart';
import 'package:graduate_project/features/upload/data/repo/upload_video_repo.dart';
import 'package:graduate_project/features/upload/manager/audio_player_cubit/audio_player_cubit.dart';
import 'package:graduate_project/features/upload/manager/saving_video_cubit/saving_video_cubit.dart';
import 'package:graduate_project/features/upload/manager/upload_video_cubit.dart/upload_video_cubit.dart';
import 'package:graduate_project/features/upload/manager/upload_cubit/upload_cubit.dart';

final di = GetIt.instance;

Future<void> setUp() async {
  di.registerSingleton<ConnectInternetHelper>(ConnectInternetHelper());
  di.registerSingleton<Dio>(Dio());
  di.registerSingleton<ApiHelper>(ApiHelper(dio: di<Dio>()));

  di.registerSingleton<SiginUpRepo>(
    SiginUpRepo(
      api: di<ApiHelper>(),
      connectInternetHelper: di<ConnectInternetHelper>(),
    ),
  );

  di.registerSingleton<SiginUpCubit>(SiginUpCubit(repo: di<SiginUpRepo>()));

  di.registerSingleton<ConfirmEmailRepo>(ConfirmEmailRepo(
    api: di<ApiHelper>(),
    connectInternetHelper: di<ConnectInternetHelper>(),
  ));

  di.registerSingleton<LoginRepo>(LoginRepo(
    api: di<ApiHelper>(),
    connectInternetHelper: di<ConnectInternetHelper>(),
  ));

  di.registerSingleton<LoginCubit>(LoginCubit(di<LoginRepo>()));

  di.registerSingleton<ConfirmEmailCubit>(
      ConfirmEmailCubit(di<ConfirmEmailRepo>()));

  di.registerSingleton<ForgetPasswordRepo>(ForgetPasswordRepo(
      api: di<ApiHelper>(),
      connectInternetHelper: di<ConnectInternetHelper>()));

  di.registerSingleton<ForgetPasswordCubit>(
      ForgetPasswordCubit(repo: di<ForgetPasswordRepo>()));

  di.registerSingleton<ResetPasswordRepo>(ResetPasswordRepo(
      api: di<ApiHelper>(),
      connectInternetHelper: di<ConnectInternetHelper>()));

  di.registerSingleton<ResetPasswordCubit>(
      ResetPasswordCubit(repo: di<ResetPasswordRepo>()));
  di.registerSingleton<DictionaryAddFavoriteRepo>(
    DictionaryAddFavoriteRepo(
      apiHelper: di<ApiHelper>(),
      connectInternetHelper: di<ConnectInternetHelper>(),
    ),
  );
  di.registerSingleton<SignDictionaryRepo>(SignDictionaryRepo(
      apiHelper: di<ApiHelper>(),
      dictionaryAddFavoriteRepo: di<DictionaryAddFavoriteRepo>(),
      connectInternetHelper: di<ConnectInternetHelper>()));

  di.registerSingleton<SignDictionaryCubit>(
      SignDictionaryCubit(repo: di<SignDictionaryRepo>()));

  di.registerSingleton<HomeCubit>(HomeCubit());

  di.registerSingleton<DictionarySearchRepo>(DictionarySearchRepo(
      api: di<ApiHelper>(),
      connectInternetHelper: di<ConnectInternetHelper>()));
  di.registerSingleton<DictionaryWordRepo>(DictionaryWordRepo(
      api: di<ApiHelper>(),
      connectInternetHelper: di<ConnectInternetHelper>()));

  di.registerSingleton<DictionarySearchCubit>(DictionarySearchCubit(
      repo: di<DictionarySearchRepo>(),
      favoriteRepo: di<DictionaryAddFavoriteRepo>()));

  di.registerSingleton<ChatRepo>(
    ChatRepo(
      api: di<ApiHelper>(),
      connectInternetHelper: di<ConnectInternetHelper>(),
    ),
  );

  di.registerSingleton<EditProfileRepo>(
    EditProfileRepo(
      apiHelper: di<ApiHelper>(),
      connectInternetHelper: di<ConnectInternetHelper>(),
    ),
  );
  di.registerSingleton<ChangePasswordRepo>(
    ChangePasswordRepo(
      apiHelper: di<ApiHelper>(),
      connectInternetHelper: di<ConnectInternetHelper>(),
    ),
  );
  di.registerSingleton<HomeDictionarRepo>(
    HomeDictionarRepo(
      apiHelper: di<ApiHelper>(),
      connectInternetHelper: di<ConnectInternetHelper>(),
    ),
  );
  di.registerSingleton<UploadVideoRepo>(
    UploadVideoRepo(
      apiHelper: di<ApiHelper>(),
      connectInternetHelper: di<ConnectInternetHelper>(),
    ),
  );
  di.registerSingleton<SavingVideoRepo>(
    SavingVideoRepo(
      apiHelper: di<ApiHelper>(),
      connectInternetHelper: di<ConnectInternetHelper>(),
    ),
  );
  di.registerSingleton<VideoToTextSaveRepo>(
    VideoToTextSaveRepo(
      apiHelper: di<ApiHelper>(),
      connectInternetHelper: di<ConnectInternetHelper>(),
    ),
  );
  di.registerSingleton<VideoToAudioSaveRepo>(
    VideoToAudioSaveRepo(
      apiHelper: di<ApiHelper>(),
      connectInternetHelper: di<ConnectInternetHelper>(),
    ),
  );
  di.registerSingleton<DicationrySavingRepo>(
    DicationrySavingRepo(
      apiHelper: di<ApiHelper>(),
      connectInternetHelper: di<ConnectInternetHelper>(),
    ),
  );
  di.registerSingleton<TrasnlationSavingRepo>(
    TrasnlationSavingRepo(
      apiHelper: di<ApiHelper>(),
      connectInternetHelper: di<ConnectInternetHelper>(),
    ),
  );
  di.registerSingleton<GetAllDataSavingRepo>(
    GetAllDataSavingRepo(
      apiHelper: di<ApiHelper>(),
      connectInternetHelper: di<ConnectInternetHelper>(),
    ),
  );

  di.registerSingleton<EditProfileCubit>(
      EditProfileCubit(di<EditProfileRepo>()));
  di.registerSingleton<ChatCubit>(ChatCubit(repo: di<ChatRepo>()));
  di.registerSingleton<MicCubit>(MicCubit());
  di.registerSingleton<SavingCubit>(SavingCubit());
  di.registerSingleton<ChangeImageCubit>(ChangeImageCubit());
  di.registerSingleton<ManagerUserDataCubit>(ManagerUserDataCubit());
  di.registerSingleton<ChangePasswordCubit>(
      ChangePasswordCubit(di<ChangePasswordRepo>()));
  di.registerSingleton<HomeDictionaryCubit>(
      HomeDictionaryCubit(di<HomeDictionarRepo>()));
  di.registerSingleton<UploadCubit>(UploadCubit());
  di.registerSingleton<AudioPlayerCubit>(AudioPlayerCubit());
  di.registerSingleton<UploadVideoCubit>(UploadVideoCubit(
    di<UploadVideoRepo>(),
  ));
  di.registerSingleton<SavingVideoCubit>(SavingVideoCubit(
    di<SavingVideoRepo>(),
  ));
  di.registerSingleton<VideoToTextCubit>(VideoToTextCubit(
    di<VideoToTextSaveRepo>(),
  ));
  di.registerSingleton<VideoToAudioSaveCubit>(VideoToAudioSaveCubit(
    di<VideoToAudioSaveRepo>(),
  ));
  di.registerSingleton<DictionarySavingCubit>(DictionarySavingCubit(
    di<DicationrySavingRepo>(),
  ));
  di.registerSingleton<TrsanlationSavingCubit>(TrsanlationSavingCubit(
    di<TrasnlationSavingRepo>(),
  ));
  di.registerSingleton<GetAllDataSavingCubit>(GetAllDataSavingCubit(
    di<GetAllDataSavingRepo>(),
  ));
}
