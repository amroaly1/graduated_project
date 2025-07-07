import 'package:dartz/dartz.dart';
import 'package:graduate_project/core/helper/connect_internet_helper.dart';
import 'package:graduate_project/core/model/api_response.dart';
import 'package:graduate_project/core/network/api_end_point.dart';
import 'package:graduate_project/core/network/api_helper.dart';
import 'package:graduate_project/core/network/api_keys.dart';
import 'package:graduate_project/core/resource/string_manager.dart';
import 'package:graduate_project/core/storage/shared_preference_helper.dart';
import 'package:graduate_project/features/home/data/model/search_model.dart';

class HomeSearchRepo {
  final ApiHelper apiHelper;
  final ConnectInternetHelper connectInternetHelper;

  HomeSearchRepo(
      {required this.apiHelper, required this.connectInternetHelper});

  Future<Either<String, SearchModel>> getSearchResult(String word) async {
    bool isConnect = await connectInternetHelper.checkInternetConnection();
    if (isConnect) {
      var response = await apiHelper.get(
          endpoint: "${ApiEndPoint.baseUrl2}/user/${getUserId()}/search",
          queryParameters: {"query": word});
      if (response is ApiReponseSuccess) {
        return right(SearchModel.fromJson(response.data!));
      } else {
        return left(response.errormessage ?? StringManager.unExperctedError);
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
