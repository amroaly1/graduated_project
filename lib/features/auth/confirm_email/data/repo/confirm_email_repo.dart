import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:graduate_project/core/helper/api_code.dart';
import 'package:graduate_project/core/helper/connect_internet_helper.dart';
import 'package:graduate_project/core/model/api_response.dart';
import 'package:graduate_project/core/network/api_end_point.dart';
import 'package:graduate_project/core/network/api_helper.dart';
import 'package:graduate_project/core/network/api_keys.dart';
import 'package:graduate_project/core/resource/string_manager.dart';
import 'package:graduate_project/features/auth/confirm_email/data/model/send_cofirm_email_model.dart';
import 'package:graduate_project/features/auth/confirm_email/data/model/send_confirm_error.dart';

class ConfirmEmailRepo {
  final ApiHelper api;
  final ConnectInternetHelper connectInternetHelper;

  ConfirmEmailRepo({required this.api, required this.connectInternetHelper});

  Future<Either<SendConfirmError, void>> sendEmailConfirm(
      {required String email}) async {
    bool isConnect = await connectInternetHelper.checkInternetConnection();

    if (isConnect) {
      try {
        var response = await api.patch(
            endpoint: ApiEndPoint.sendEmailConfirmation,
            data: {ApiKeys.email: email});

        if (response is ApiReponseSuccess) {
          SendCofirmEmailModel res =
              SendCofirmEmailModel.fromJson(response.data);

          if (res.isSuccess) {
            return right(null);
          } else {
            return left(SendConfirmError(
                errMessage: getErrorMessage(res.errorCode),
                isConnectInternet: isConnect));
          }
        } else {
          if (response.isProblemFromInternrt) {
            return left(SendConfirmError(
                errMessage: StringManager.noInternetError,
                isConnectInternet: isConnect));
          } else {
            return left(SendConfirmError(
                errMessage: response.errormessage ?? "UnExpected Error",
                isConnectInternet: isConnect));
          }
        }
      } catch (e) {
        log("\n):\n------------------- Error $e --------------------\n):\n");
        return left(SendConfirmError(
            errMessage: "UnExpected Error", isConnectInternet: isConnect));
      }
    } else {
      return left(SendConfirmError(
          errMessage: StringManager.noInternetError,
          isConnectInternet: isConnect));
    }
  }

  Future<Either<String, void>> confirmEmail(
      {required String email, required String verificationCode}) async {
    bool isConnect = await connectInternetHelper.checkInternetConnection();

    if (isConnect) {
      try {
        var response =
            await api.patch(endpoint: ApiEndPoint.confirmEmail, data: {
          ApiKeys.email: email,
          ApiKeys.verificationCode: verificationCode,
        });

        if (response is ApiReponseSuccess) {
          SendCofirmEmailModel res =
              SendCofirmEmailModel.fromJson(response.data);

          if (res.isSuccess) {
            return right(null);
          } else {
            return left(getErrorMessage(res.errorCode));
          }
        } else {
          if (response.isProblemFromInternrt) {
            return left(StringManager.noInternetError);
          } else {
            return left(response.errormessage ?? "UnExpected Error");
          }
        }
      } catch (e) {
        log("\n):\n------------------- Error $e --------------------\n):\n");
        return left("UnExpected Error");
      }
    } else {
      return left(StringManager.noInternetError);
    }
  }
}
