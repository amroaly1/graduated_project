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
import 'package:graduate_project/features/dictionary/data/repo/dictionary_search_repo.dart';
import 'package:graduate_project/features/dictionary/data/repo/sign_dictionary_repo.dart';
import 'package:graduate_project/features/dictionary/manager/dictionary_search/dictionary_search_cubit.dart';
import 'package:graduate_project/features/dictionary/manager/sign_dictionary/sign_dictionary_cubit.dart';
import 'package:graduate_project/features/home/manager/home_cubit/cubit/home_cubit.dart';

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

  di.registerSingleton<SignDictionaryRepo>(SignDictionaryRepo(
      apiHelper: di<ApiHelper>(),
      connectInternetHelper: di<ConnectInternetHelper>()));

  di.registerSingleton<SignDictionaryCubit>(
      SignDictionaryCubit(repo: di<SignDictionaryRepo>()));

  di.registerSingleton<HomeCubit>(HomeCubit());

  di.registerSingleton<DictionarySearchRepo>(DictionarySearchRepo(
      api: di<ApiHelper>(),
      connectInternetHelper: di<ConnectInternetHelper>()));

  di.registerSingleton<DictionarySearchCubit>(
      DictionarySearchCubit(repo: di<DictionarySearchRepo>()));
}
