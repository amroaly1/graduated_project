import 'package:dartz/dartz.dart';
import 'package:graduate_project/core/helper/connect_internet_helper.dart';
import 'package:graduate_project/core/model/api_response.dart';
import 'package:graduate_project/core/network/api_end_point.dart';
import 'package:graduate_project/core/network/api_helper.dart';
import 'package:graduate_project/core/network/api_keys.dart';
import 'package:graduate_project/core/resource/string_manager.dart';
import 'package:graduate_project/core/storage/shared_preference_helper.dart';
import 'package:graduate_project/features/chat_with_ai/data/model/chat_model.dart';
import 'package:graduate_project/features/chat_with_ai/data/model/chat_response_model.dart';

class ChatWitApiRepo {
  final ApiHelper api;
  final ConnectInternetHelper connectInternetHelper;

  ChatWitApiRepo({required this.api, required this.connectInternetHelper});

/*
 "user_id": 0,
  "chat_id": 0,
  "query": "string",
  "category": "string",
  "subcategory": "string"
*/
  Future<Either<String, ChatResponse>> addMessage({
    required String message,
    required int? chatId,
  }) async {
    bool isconnect = await connectInternetHelper.checkInternetConnection();
    if (isconnect) {
      try {
        var response = await api.post(
          endpoint: ApiEndPoint.ask,
          data: chatId != null
              ? {
                  ApiKeys.userid: getUserId(),
                  ApiKeys.query: message,
                  ApiKeys.chatid: chatId,
                }
              : {
                  ApiKeys.userid: getUserId(),
                  ApiKeys.query: message,
                },
        );
        if (response is ApiReponseSuccess) {
          return right(ChatResponse.fromJson(response.data));
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

  Future<Either<String, ChatWithAiModel>> getSpecificChat(
      {required int chatId}) async {
    bool isconnect = await connectInternetHelper.checkInternetConnection();
    if (isconnect) {
      // try {
      var response = await api.get(
          endpoint: "${ApiEndPoint.getSpecificChat}/${getUserId()}/$chatId");
      if (response is ApiReponseSuccess) {
        return right(ChatWithAiModel.fromJson(response.data));
      } else {
        return left(response.errormessage ?? StringManager.unExperctedError);
      }
      // }
      // catch (e) {
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
