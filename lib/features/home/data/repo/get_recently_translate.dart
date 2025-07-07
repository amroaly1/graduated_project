import 'package:dartz/dartz.dart';
import 'package:graduate_project/core/helper/connect_internet_helper.dart';
import 'package:graduate_project/core/model/api_response.dart';
import 'package:graduate_project/core/network/api_end_point.dart';
import 'package:graduate_project/core/network/api_helper.dart';
import 'package:graduate_project/core/network/api_keys.dart';
import 'package:graduate_project/core/resource/string_manager.dart';
import 'package:graduate_project/core/storage/shared_preference_helper.dart';
import 'package:graduate_project/features/home/data/model/recenlty_transalte_model.dart';

class GetRecentlyTranslateRepo {
  final ApiHelper apiHelper;
  final ConnectInternetHelper connectInternetHelper;

  GetRecentlyTranslateRepo(
      {required this.apiHelper, required this.connectInternetHelper});

  Future<Either<String, RecenltyTransalteModel>> getRecentalySaved() async {
    bool isConnect = await connectInternetHelper.checkInternetConnection();
    if (isConnect) {
      // try {
      var response = await apiHelper.get(
          endpoint:
              "${ApiEndPoint.baseUrl2}/user/${getUserId()}/recent-translations/all");
      if (response is ApiReponseSuccess) {
        return right(RecenltyTransalteModel.fromJson(response.data!));
      } else {
        return left(response.errormessage ?? StringManager.unExperctedError);
      }
      // } catch (e) {
      //   return left(StringManager.unExperctedError);
      // }
    } else {
      return left(StringManager.noInternetError);
    }
  }

  int getUserId() {
    SharedPreferenceHelper helper = SharedPreferenceHelper();
    return helper.getData(key: ApiKeys.userId) ?? 0;
  }
}
