import 'package:dartz/dartz.dart';
import 'package:graduate_project/core/helper/connect_internet_helper.dart';
import 'package:graduate_project/core/model/api_response.dart';
import 'package:graduate_project/core/network/api_end_point.dart';
import 'package:graduate_project/core/network/api_helper.dart';
import 'package:graduate_project/core/network/api_keys.dart';
import 'package:graduate_project/core/resource/string_manager.dart';
import 'package:graduate_project/core/storage/shared_preference_helper.dart';
import 'package:graduate_project/features/signGPT/data/model/search_model.dart';

class GetSearchChatRepo {
  final ApiHelper api;
  final ConnectInternetHelper connectInternetHelper;

  GetSearchChatRepo({required this.api, required this.connectInternetHelper});

  Future<Either<String, SearchModel>> getSearchResult(
      {required String word}) async {
    bool isConnect = await connectInternetHelper.checkInternetConnection();
    if (isConnect) {
      try {
        var response = await api.get(
            endpoint: "${ApiEndPoint.serach}/${getUserId()}",
            queryParameters: {"q": word});
        if (response is ApiReponseSuccess) {
          return right(SearchModel.fromJson(response.data!));
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
    SharedPreferenceHelper helper = SharedPreferenceHelper();
    return helper.getData(key: ApiKeys.userId) ?? 0;
  }
}
