import 'package:dartz/dartz.dart';
import 'package:graduate_project/core/helper/connect_internet_helper.dart';
import 'package:graduate_project/core/model/api_response.dart';
import 'package:graduate_project/core/network/api_end_point.dart';
import 'package:graduate_project/core/network/api_helper.dart';
import 'package:graduate_project/core/network/api_keys.dart';
import 'package:graduate_project/core/resource/string_manager.dart';

class DictionaryAddFavoriteRepo {
  final ApiHelper apiHelper;
  final ConnectInternetHelper connectInternetHelper;

  DictionaryAddFavoriteRepo(
      {required this.apiHelper, required this.connectInternetHelper});

  Future<Either<String, void>> favoriteAddOrRemove({required int id}) async {
    bool isConnectToInternet =
        await connectInternetHelper.checkInternetConnection();
    if (isConnectToInternet) {
      try {
        var response = await apiHelper.post(
            endpoint: ApiEndPoint.dictionayaddFavoriteorRemove,
            queryParameters: {ApiKeys.glossId: id});
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
