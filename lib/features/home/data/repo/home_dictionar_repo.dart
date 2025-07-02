import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:graduate_project/core/helper/connect_internet_helper.dart';
import 'package:graduate_project/core/model/api_response.dart';
import 'package:graduate_project/core/network/api_end_point.dart';
import 'package:graduate_project/core/network/api_helper.dart';
import 'package:graduate_project/core/resource/string_manager.dart';
import 'package:graduate_project/features/dictionary/data/model/dictionary_item_model.dart';

class HomeDictionarRepo {
  final ApiHelper apiHelper;
  final ConnectInternetHelper connectInternetHelper;

  HomeDictionarRepo(
      {required this.apiHelper, required this.connectInternetHelper});

  Future<Either<String, List<DictionaryItemModel>>>
      getRandomDictionaryWord() async {
    bool isConnected = await connectInternetHelper.checkInternetConnection();
    if (isConnected) {
      try {
        var response =
            await apiHelper.get(endpoint: ApiEndPoint.getDictionaryRandom);
        if (response is ApiReponseSuccess) {
          log(response.data
              .map((e) => DictionaryItemModel.fromJson(e))
              .toList()
              .toString());
          return right((response.data as List)
              .map((e) => DictionaryItemModel.fromJson(e))
              .toList());
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
