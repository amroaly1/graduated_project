import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:graduate_project/core/helper/api_code.dart';
import 'package:graduate_project/core/helper/connect_internet_helper.dart';
import 'package:graduate_project/core/model/api_response.dart';
import 'package:graduate_project/core/network/api_console_id.dart';
import 'package:graduate_project/core/network/api_end_point.dart';
import 'package:graduate_project/core/network/api_helper.dart';
import 'package:graduate_project/core/network/api_keys.dart';
import 'package:graduate_project/core/resource/string_manager.dart';
import 'package:graduate_project/core/storage/shared_preference_helper.dart';
import 'package:graduate_project/features/auth/login/data/model/login_api_reponse.dart';
import 'package:graduate_project/features/auth/login/data/model/login_error.dart';
import 'package:graduate_project/features/auth/login/data/model/user_model.dart';

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
          await store(res.user!);
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
            'https://www.googleapis.com/auth/userinfo.profile',
            'https://www.googleapis.com/auth/userinfo.email',
          ],
          serverClientId: ApiConsoleId.serverClientId,
        );
        // await googleSignIn.signOut();
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
          await store(res.user!);
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

  Future<Either<LoginError, void>> loginWithFacebook() async {
    bool isConnected = await connectInternetHelper.checkInternetConnection();
    if (isConnected) {
      try {
        final LoginResult result = await FacebookAuth.instance.login(
          permissions: [
            'public_profile',
            'email',
          ],
        ); // by default we request the email and the public profile
        // or FacebookAuth.i.login()
        if (result.status == LoginStatus.success) {
          // you are logged
          final AccessToken? accessToken = result.accessToken;
          if (accessToken != null) {
            return _apiFacebook(aceesToken: accessToken.tokenString);
          } else {
            return left(LoginError(
                errMessage: "there is problem in access token using facebook",
                isEmailNoConfirm: false));
          }
        } else {
          log(result.status.toString());
          log(result.message.toString());

          return left(LoginError(
              errMessage:
                  result.message ?? "there is problem in login using facebook",
              isEmailNoConfirm: false));
        }
      } catch (e) {
        return left(LoginError(
            errMessage: "there is problem in login using facebook",
            isEmailNoConfirm: false));
      }
    } else {
      return left(LoginError(
          errMessage: StringManager.noInternetError, isEmailNoConfirm: false));
    }
  }

  Future<Either<LoginError, void>> _apiFacebook(
      {required String aceesToken}) async {
    try {
      var response = await api.post(
          endpoint: ApiEndPoint.loginWithFacebook,
          data: {ApiKeys.accessToken: aceesToken});
      if (response is ApiReponseSuccess) {
        LoginApiReponse res = LoginApiReponse.fromJson(response.data);
        if (res.isSuccess) {
          log(res.user?.email ?? "No Email");
          await store(res.user!);
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

  /*

    "userId": 0,
    "email": "string",
    "token": "string",
    "refreshToken": "string",
    "createdOn": "2025-05-22T06:54:58.497Z",
    "tokenExpiry": "2025-05-22T06:54:58.497Z",
    "refreshTokenExpiry": "2025-05-22T06:54:58.497Z"

  */

  Future<void> store(UserModel userModel) async {
    SharedPreferenceHelper sharedPreference = SharedPreferenceHelper();

    log("Token : ${userModel.token}");
    await Future.wait(
      [
        sharedPreference.saveData(
          key: ApiKeys.userId,
          value: userModel.userId,
        ),
        sharedPreference.saveData(
          key: ApiKeys.email,
          value: userModel.email,
        ),
        sharedPreference.saveData(
          key: ApiKeys.token,
          value: userModel.token,
        ),
        sharedPreference.saveData(
          key: ApiKeys.refreshToken,
          value: userModel.refreshToken,
        ),
        sharedPreference.saveData(
          key: ApiKeys.firstName,
          value: userModel.firstName,
        ),
        sharedPreference.saveData(
            key: ApiKeys.lastName, value: userModel.lastName),
        sharedPreference.saveData(
          key: ApiKeys.tokenExpiry,
          value: userModel.tokenExpiry,
        ),
        sharedPreference.saveData(
          key: ApiKeys.refreshTokenExpiry,
          value: userModel.refreshTokenExpiry,
        ),
      ],
    );
  }
}
