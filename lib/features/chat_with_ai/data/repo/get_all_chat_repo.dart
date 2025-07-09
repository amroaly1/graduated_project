import 'package:dartz/dartz.dart';
import 'package:graduate_project/core/helper/connect_internet_helper.dart';
import 'package:graduate_project/core/model/api_response.dart';
import 'package:graduate_project/core/network/api_end_point.dart';
import 'package:graduate_project/core/network/api_helper.dart';
import 'package:graduate_project/core/network/api_keys.dart';
import 'package:graduate_project/core/resource/string_manager.dart';
import 'package:graduate_project/core/storage/shared_preference_helper.dart';
import 'package:graduate_project/features/chat_with_ai/data/model/list_of_chat_model.dart';

class GetAllChatRepo {
  final ApiHelper api;
  final ConnectInternetHelper connectInternetHelper;

  GetAllChatRepo({required this.api, required this.connectInternetHelper});

  Future<Either<String, ListOfChatModel>> getAllChat() async {
    bool isconnect = await connectInternetHelper.checkInternetConnection();
    if (isconnect) {
      try {
        var response = await api.get(
            endpoint: "${ApiEndPoint.getSpecificChat}/${getUserId()}");
        if (response is ApiReponseSuccess) {
          return right(ListOfChatModel.fromJson(response.data));
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

  Future<Either<String, void>> deleteChat({required int chatId}) async {
    bool isconnect = await connectInternetHelper.checkInternetConnection();
    if (isconnect) {
      try {
        var response = await api.delete(
            endpoint: "${ApiEndPoint.getSpecificChat}/${getUserId()}/$chatId");
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
    SharedPreferenceHelper helper = SharedPreferenceHelper();
    return helper.getData(key: ApiKeys.userId) ?? 0;
  }
}
