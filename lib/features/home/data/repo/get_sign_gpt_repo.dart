import 'package:dartz/dartz.dart';
import 'package:graduate_project/core/helper/connect_internet_helper.dart';
import 'package:graduate_project/core/model/api_response.dart';
import 'package:graduate_project/core/network/api_end_point.dart';
import 'package:graduate_project/core/network/api_helper.dart';
import 'package:graduate_project/core/network/api_keys.dart';
import 'package:graduate_project/core/resource/string_manager.dart';
import 'package:graduate_project/core/storage/shared_preference_helper.dart';
import 'package:graduate_project/features/home/data/model/sign_gpt_home_response.dart';
import 'package:graduate_project/features/signGPT/data/model/chat_model.dart';

class GetSignGptRepo {
  final ApiHelper apiHelper;
  final ConnectInternetHelper connectInternetHelper;

  GetSignGptRepo(
      {required this.apiHelper, required this.connectInternetHelper});

  Future<Either<String, SignGPTHomeResponse>> getRecentlyChatSIgnGpt() async {
    bool isconnect = await connectInternetHelper.checkInternetConnection();
    if (isconnect) {
      try {
        var response = await apiHelper.get(
            endpoint: "${ApiEndPoint.baseUrlSignGpt}/latest/${getUserId()}");
        if (response is ApiReponseSuccess) {
          return right(SignGPTHomeResponse.fromJson(response.data));
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

  Future<Either<String, List<Messages>>> getRecentlyChatBridge() async {
    bool isconnect = await connectInternetHelper.checkInternetConnection();
    if (isconnect) {
      try {
        var response = await apiHelper.get(
            endpoint: ApiEndPoint.getbridgeconversationrecent);
        if (response is ApiReponseSuccess) {
          List<Messages> messages = (response.data["messages"] as List)
              .map((e) => Messages.fromJson(e))
              .toList();
          return right(messages);
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
