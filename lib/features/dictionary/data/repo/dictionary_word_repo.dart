import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:graduate_project/core/helper/connect_internet_helper.dart';
import 'package:graduate_project/core/model/api_response.dart';
import 'package:graduate_project/core/network/api_end_point.dart';
import 'package:graduate_project/core/network/api_helper.dart';
import 'package:graduate_project/core/network/api_keys.dart';
import 'package:graduate_project/core/resource/string_manager.dart';
import 'package:graduate_project/features/dictionary/data/model/resentaly_serach_model.dart';

class DictionaryWordRepo {
  final ApiHelper api;
  final ConnectInternetHelper connectInternetHelper;

  DictionaryWordRepo({required this.api, required this.connectInternetHelper});

  Future<Either<String, List<ResentalySerachModel>>> getResentSearch() async {
    bool isConnectToInternet =
        await connectInternetHelper.checkInternetConnection();
    if (isConnectToInternet) {
      try {
        var response = await api.get(
          endpoint: "${ApiEndPoint.dictionaySearchHistory}/10",
        );
        if (response is ApiReponseSuccess) {
          List<ResentalySerachModel> data = [];
          for (var element in response.data!) {
            var item = ResentalySerachModel.fromJson(element);
            data.add(item);
          }
          log(data.toString());
          return right(data);
        } else {
          return left(response.errormessage ?? StringManager.unExperctedError);
        }
      } catch (e) {
        return left(StringManager.unExperctedError);
      }
    } else {
      return left(StringManager.noInternetError);
    }
  }

  Future<Either<String, void>> deleteResentSearch({required int id}) async {
    bool isConnectToInternet =
        await connectInternetHelper.checkInternetConnection();
    if (isConnectToInternet) {
      try {
        var response = await api.delete(
          endpoint: "${ApiEndPoint.dictionaySearchHistoryDelete}/$id",
        );
        if (response is ApiReponseSuccess) {
          return right(null);
        } else {
          return left(response.errormessage ?? StringManager.unExperctedError);
        }
      } catch (e) {
        return left(StringManager.unExperctedError);
      }
    } else {
      return left(StringManager.noInternetError);
    }
  }
}
