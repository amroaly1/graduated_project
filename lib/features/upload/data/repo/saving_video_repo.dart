import 'package:dartz/dartz.dart';
import 'package:graduate_project/core/helper/connect_internet_helper.dart';
import 'package:graduate_project/core/model/api_response.dart';
import 'package:graduate_project/core/network/api_end_point.dart';
import 'package:graduate_project/core/network/api_helper.dart';
import 'package:graduate_project/core/network/api_keys.dart';
import 'package:graduate_project/core/resource/string_manager.dart';
import 'package:graduate_project/core/storage/shared_preference_helper.dart';

class SavingVideoRepo {
  final ApiHelper apiHelper;
  final ConnectInternetHelper connectInternetHelper;

  SavingVideoRepo({
    required this.apiHelper,
    required this.connectInternetHelper,
  });

  Future<Either<String, void>> savingVideo({
    required String trsnlationid,
    required bool returnaudio,
  }) async {
    bool connected = await connectInternetHelper.checkInternetConnection();

    if (connected) {
      try {
        var response =
            await apiHelper.post(endpoint: ApiEndPoint.savingVideo, data: {
          ApiKeys.translationId: trsnlationid,
          ApiKeys.returnaudio: returnaudio,
          ApiKeys.userid: getUserId(),
        });
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

  Future<Either<String, void>> deleteVideoText({
    required String trsnlationid,
  }) async {
    bool connected = await connectInternetHelper.checkInternetConnection();

    if (connected) {
      try {
        var response = await apiHelper.delete(
          endpoint:
              "${ApiEndPoint.baseUrl2}/user/${getUserId()}/translations/with-text/$trsnlationid",
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

  Future<Either<String, void>> deleteVideoAudio({
    required String trsnlationid,
  }) async {
    bool connected = await connectInternetHelper.checkInternetConnection();

    if (connected) {
      try {
        var response = await apiHelper.delete(
          endpoint:
              "${ApiEndPoint.baseUrl2}/user/${getUserId()}/translations/with-audio/$trsnlationid",
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

  int getUserId() {
    SharedPreferenceHelper sharedPreferenceHelper = SharedPreferenceHelper();
    return sharedPreferenceHelper.getData(key: ApiKeys.userId) ?? 0;
  }
}
