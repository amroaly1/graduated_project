import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:graduate_project/core/helper/api_code.dart';
import 'package:graduate_project/core/helper/connect_internet_helper.dart';
import 'package:graduate_project/core/model/api_response.dart';
import 'package:graduate_project/core/network/api_end_point.dart';
import 'package:graduate_project/core/network/api_helper.dart';
import 'package:graduate_project/core/network/api_keys.dart';
import 'package:graduate_project/core/resource/string_manager.dart';
import 'package:graduate_project/features/auth/forget_password/data/model/response_from_api.dart';

class ForgetPasswordRepo {
  final ApiHelper api;
  final ConnectInternetHelper connectInternetHelper;

  ForgetPasswordRepo({required this.api, required this.connectInternetHelper});

  Future<Either<String, void>> createPasswordResetToken(
      {required String email}) async {
    bool connect = await connectInternetHelper.checkInternetConnection();

    if (connect) {
      try {
        final reponse = await api.post(
            endpoint: ApiEndPoint.forgatPassword, data: {ApiKeys.email: email});

        if (reponse is ApiReponseSuccess) {
          ResponseFromApi res = ResponseFromApi.fromJson(reponse.data);

          if (res.isSuccess) {
            return right(null);
          } else {
            return left(getErrorMessage(res.error.code));
          }
        } else {
          if (reponse.isProblemFromInternrt) {
            return left(StringManager.noInternetError);
          } else {
            return left(reponse.errormessage ?? "UnExpected Error");
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
