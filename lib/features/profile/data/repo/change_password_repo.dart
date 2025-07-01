import 'package:dartz/dartz.dart';
import 'package:graduate_project/core/helper/connect_internet_helper.dart';
import 'package:graduate_project/core/model/api_response.dart';
import 'package:graduate_project/core/network/api_end_point.dart';
import 'package:graduate_project/core/network/api_helper.dart';
import 'package:graduate_project/core/network/api_keys.dart';
import 'package:graduate_project/core/resource/string_manager.dart';

class ChangePasswordRepo {
  final ApiHelper apiHelper;
  final ConnectInternetHelper connectInternetHelper;

  ChangePasswordRepo({
    required this.apiHelper,
    required this.connectInternetHelper,
  });

  Future<Either<String, void>> changePassword(
      {required String oldPassword, required String newPassword}) async {
    bool isConnect = await connectInternetHelper.checkInternetConnection();
    if (isConnect) {
      try {
        var response = await apiHelper.post(
          endpoint: ApiEndPoint.changePassword,
          data: {
            ApiKeys.oldPassword: oldPassword,
            ApiKeys.newPassword: newPassword,
          },
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
