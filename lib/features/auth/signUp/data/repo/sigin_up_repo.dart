import 'dart:developer';

import 'package:graduate_project/core/helper/api_code.dart';
import 'package:graduate_project/core/helper/connect_internet_helper.dart';
import 'package:graduate_project/core/model/api_response.dart';
import 'package:graduate_project/core/network/api_end_point.dart';
import 'package:graduate_project/core/network/api_helper.dart';
import 'package:dartz/dartz.dart';
import 'package:graduate_project/core/resource/string_manager.dart';
import 'package:graduate_project/features/auth/signUp/data/model/sign_up_model.dart';
import 'package:graduate_project/features/auth/signUp/data/model/sign_up_reponse_model.dart';

class SiginUpRepo {
  final ApiHelper api;
  final ConnectInternetHelper connectInternetHelper;

  SiginUpRepo({required this.api, required this.connectInternetHelper});

  Future<Either<String, void>> siginUp({
    required SignUpModel data,
  }) async {
    bool isConnectToInternet =
        await connectInternetHelper.checkInternetConnection();

    if (isConnectToInternet) {
      var response =
          await api.post(endpoint: ApiEndPoint.register, data: data.toMap());

      if (response is ApiReponseSuccess) {
        try {
          SignUpReponseModel responseModel =
              SignUpReponseModel.fromJson(response.data!);

          if (responseModel.isSuccess) {
            return right(null);
          } else {
            return left(getErrorMessage(responseModel.errorCode));
          }
        } catch (e) {
          log("\n----------------------):\nException $e \n----------------------):\n");
          return left(StringManager.unExperctedError);
        }
      } else {
        return left(response.errormessage ?? StringManager.unExperctedError);
      }
    } else {
      return left(StringManager.noInternetError);
    }
  }
}
