import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:graduate_project/core/helper/connect_internet_helper.dart';
import 'package:graduate_project/core/network/api_helper.dart';
import 'package:graduate_project/features/auth/confirm_email/data/repo/confirm_email_repo.dart';
import 'package:graduate_project/features/auth/confirm_email/manager/cubit/confirm_email_cubit.dart';
import 'package:graduate_project/features/auth/signUp/data/repo/sigin_up_repo.dart';
import 'package:graduate_project/features/auth/signUp/manager/cubit/sigin_up_cubit.dart';

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

  di.registerSingleton<ConfirmEmailCubit>(ConfirmEmailCubit(
    di<ConfirmEmailRepo>(),
  ));
}
