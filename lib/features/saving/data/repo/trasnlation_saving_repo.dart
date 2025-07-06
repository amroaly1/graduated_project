import 'package:dartz/dartz.dart';
import 'package:graduate_project/core/helper/connect_internet_helper.dart';
import 'package:graduate_project/core/model/api_response.dart';
import 'package:graduate_project/core/network/api_end_point.dart';
import 'package:graduate_project/core/network/api_helper.dart';
import 'package:graduate_project/core/network/api_keys.dart';
import 'package:graduate_project/core/resource/string_manager.dart';
import 'package:graduate_project/core/storage/shared_preference_helper.dart';
import 'package:graduate_project/features/saving/data/model/translation_saving_model.dart';

class TrasnlationSavingRepo {
  final ApiHelper apiHelper;
  final ConnectInternetHelper connectInternetHelper;

  TrasnlationSavingRepo(
      {required this.apiHelper, required this.connectInternetHelper});

  Future<Either<String, TranslationSavingModel>> getSavingTranslation() async {
    bool connected = await connectInternetHelper.checkInternetConnection();
    if (connected) {
      try {
        var response = await apiHelper
            .get(endpoint: ApiEndPoint.getSavingTranslation, queryParameters: {
          ApiKeys.userid: getUserId(),
        });
        if (response is ApiReponseSuccess) {
          return right(TranslationSavingModel.fromJson(response.data));
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

  int getUserId() {
    SharedPreferenceHelper sharedPreferenceHelper = SharedPreferenceHelper();
    return sharedPreferenceHelper.getData(key: ApiKeys.userId) ?? 0;
  }
}
