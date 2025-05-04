import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:graduate_project/core/helper/api_code.dart';
import 'package:graduate_project/core/helper/connect_internet_helper.dart';
import 'package:graduate_project/core/model/api_response.dart';
import 'package:graduate_project/core/model/response_from_api.dart';
import 'package:graduate_project/core/network/api_end_point.dart';
import 'package:graduate_project/core/network/api_helper.dart';
import 'package:graduate_project/core/network/api_keys.dart';
import 'package:graduate_project/core/resource/string_manager.dart';

class ResetPasswordRepo {
  final ApiHelper api;
  final ConnectInternetHelper connectInternetHelper;

  ResetPasswordRepo({required this.api, required this.connectInternetHelper});

  Future<Either<String, void>> resetPassowrd(
      {required String code,
      required String email,
      required String newPassword}) async {
    bool isConnect = await connectInternetHelper.checkInternetConnection();

    if (isConnect) {
      try {
        final res = await api.post(endpoint: ApiEndPoint.restPassoword, data: {
          ApiKeys.token: code,
          ApiKeys.email: email,
          ApiKeys.newPassword: newPassword
        });

        if (res is ApiReponseSuccess) {
          final response = ResponseFromApi.fromJson(res.data);
          if (response.isSuccess) {
            return right(null);
          } else {
            return left(getErrorMessage(response.error.code));
          }
        } else {
          if (res.isProblemFromInternrt) {
            return left(StringManager.noInternetError);
          } else {
            return left(res.errormessage ?? "UnExpected Error");
          }
        }
      } catch (e) {
        log("/n-------------------/n ): $e ): /n-------------------/n");
        return left("UnExpected Error");
      }
    } else {
      return left(StringManager.noInternetError);
    }
  }
}
