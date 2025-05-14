import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:google_sign_in/google_sign_in.dart';
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

  Future<Either<LoginError, void>> loginGoogle() async {
    bool isConnected = await connectInternetHelper.checkInternetConnection();

    if (isConnected) {
      try {
        GoogleSignIn googleSignIn = GoogleSignIn(
          scopes: [
            'openid',
            'profile',
            'email',
          ],
        );
        await googleSignIn.signOut();
        final GoogleSignInAccount? googleAccount = await googleSignIn.signIn();

        final GoogleSignInAuthentication? googleAuthentication =
            await googleAccount?.authentication;
        log(googleAuthentication?.idToken.toString() ??
            "googleAuthentication is null");
        if (googleAuthentication != null) {
          String idToken = googleAuthentication.idToken ?? "";

          if (idToken.isNotEmpty) {
            return _apiGoogle(idToken: idToken);
          } else {
            return left(LoginError(
                errMessage: "there is problem in login in using google",
                isEmailNoConfirm: false));
          }
        } else {
          return left(LoginError(
              errMessage: "there is problem in login in using google",
              isEmailNoConfirm: false));
        }
      } catch (e) {
        return left(LoginError(
            errMessage: "UnExpected Error", isEmailNoConfirm: false));
      }
    } else {
      return left(LoginError(
          errMessage: StringManager.noInternetError, isEmailNoConfirm: false));
    }
  }

  Future<Either<LoginError, void>> _apiGoogle({required String idToken}) async {
    try {
      var response = await api.post(
          endpoint: ApiEndPoint.loginWithGoogle,
          data: {ApiKeys.idToken: idToken});
      if (response is ApiReponseSuccess) {
        LoginApiReponse res = LoginApiReponse.fromJson(response.data);
        if (res.isSuccess) {
          log(res.user?.email ?? "No Email");
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
    } catch (e) {
      return left(
          LoginError(errMessage: "UnExpected Error", isEmailNoConfirm: false));
    }
  }
}
