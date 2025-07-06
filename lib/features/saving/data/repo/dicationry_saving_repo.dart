import 'package:dartz/dartz.dart';
import 'package:graduate_project/core/helper/connect_internet_helper.dart';
import 'package:graduate_project/core/model/api_response.dart';
import 'package:graduate_project/core/network/api_end_point.dart';
import 'package:graduate_project/core/network/api_helper.dart';
import 'package:graduate_project/core/resource/string_manager.dart';
import 'package:graduate_project/features/saving/data/model/dictionary_saving_model.dart';

class DicationrySavingRepo {
  final ApiHelper apiHelper;
  final ConnectInternetHelper connectInternetHelper;

  DicationrySavingRepo(
      {required this.apiHelper, required this.connectInternetHelper});

  Future<Either<String, List<DictionarySavingModel>>>
      getSavingDictionary() async {
    bool connected = await connectInternetHelper.checkInternetConnection();
    if (connected) {
      try {
        var response = await apiHelper.get(
            endpoint: ApiEndPoint.getAllDictionaryFavorites);
        if (response is ApiReponseSuccess) {
          return right((response.data as List)
              .map((e) => DictionarySavingModel.fromJson(e))
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
