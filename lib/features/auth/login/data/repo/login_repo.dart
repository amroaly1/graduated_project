import 'package:dartz/dartz.dart';
import 'package:graduate_project/core/helper/api_code.dart';
import 'package:graduate_project/core/helper/connect_internet_helper.dart';
import 'package:graduate_project/core/model/api_response.dart';
import 'package:graduate_project/core/network/api_end_point.dart';
import 'package:graduate_project/core/network/api_helper.dart';
import 'package:graduate_project/core/network/api_keys.dart';
import 'package:graduate_project/core/resource/string_manager.dart';
import 'package:graduate_project/features/auth/login/data/model/login_api_reponse.dart';
import 'package:graduate_project/features/auth/login/data/model/login_error.dart';

class LoginRepo {
  final ApiHelper api;
  final ConnectInternetHelper connectInternetHelper;

  LoginRepo({required this.api, required this.connectInternetHelper});

  Future<Either<LoginError, void>> login(
      {required String email, required String password}) async {
    bool isConnected = await connectInternetHelper.checkInternetConnection();

    if (isConnected) {
      var response = await api.post(endpoint: ApiEndPoint.login, data: {
        ApiKeys.email: email,
        ApiKeys.password: password,
        ApiKeys.rememberMe: true
      });

      if (response is ApiReponseSuccess) {
        var res = LoginApiReponse.fromJson(response.data);

        if (res.isSuccess) {
          // store data in hive
          return right(null);
        } else {
          if (res.error.code == 1001) {
            return left(LoginError(
                errMessage: getErrorMessage(res.error.code),
                isEmailNoConfirm: true));
          } else {
            return left(LoginError(
                errMessage: getErrorMessage(res.error.code),
                isEmailNoConfirm: false));
          }
        }
      } else {
        if (response.isProblemFromInternrt) {
          return left(LoginError(
              errMessage: StringManager.noInternetError,
              isEmailNoConfirm: false));
        } else {
          return left(LoginError(
              errMessage: response.errormessage ?? "UnExpected Error",
              isEmailNoConfirm: false));
        }
      }
    } else {
      return left(LoginError(
          errMessage: StringManager.noInternetError, isEmailNoConfirm: false));
    }
  }
}
