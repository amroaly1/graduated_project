import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:graduate_project/core/helper/connect_internet_helper.dart';
import 'package:graduate_project/core/model/api_response.dart';
import 'package:graduate_project/core/network/api_end_point.dart';
import 'package:graduate_project/core/network/api_helper.dart';
import 'package:graduate_project/core/network/api_keys.dart';
import 'package:graduate_project/core/resource/string_manager.dart';
import 'package:graduate_project/core/storage/shared_preference_helper.dart';
import 'package:graduate_project/features/chat/data/model/chat_model.dart';
import 'package:graduate_project/features/chat/data/model/delete_chat_model.dart';
import 'package:graduate_project/features/chat/data/model/save_chat_model.dart';

class ChatRepo {
  final ApiHelper api;
  final ConnectInternetHelper connectInternetHelper;
  final int? userId = SharedPreferenceHelper().getData(key: ApiKeys.userId);

  ChatRepo({required this.api, required this.connectInternetHelper});

  Future<Either<String, ChatModel>> doChat({required String text}) async {
    bool isConnect = await connectInternetHelper.checkInternetConnection();

    if (isConnect) {
      try {
        var response = await api.get(
            endpoint: ApiEndPoint.getChat,
            queryParameters: {ApiKeys.gloss: text, ApiKeys.userid: userId});
        if (response is ApiReponseSuccess) {
          // log(response.data.toString());
          log("SUccess");

          return right(ChatModel.fromJson(response.data));
        } else {
          return left(response.errormessage ?? StringManager.unExperctedError);
        }
      } catch (e) {
        log(e.toString());
        return left(StringManager.unExperctedError);
      }
    } else {
      return left(StringManager.noInternetError);
    }
  }

  Future<Either<String, SaveChatModel>> save({required String word}) async {
    bool isConnectToInternet =
        await connectInternetHelper.checkInternetConnection();
    if (isConnectToInternet) {
      try {
        var response =
            await api.post(endpoint: ApiEndPoint.saveWordInChat, data: {
          ApiKeys.userid: userId,
          ApiKeys.text: word,
          "generate_audio": false,
        });
        if (response is ApiReponseSuccess) {
          return right(SaveChatModel.fromJson(response.data));
        } else {
          return left(response.errormessage ?? StringManager.unExperctedError);
        }
      } catch (e) {
        log(e.toString());
        return left(StringManager.unExperctedError);
      }
    } else {
      return left(StringManager.noInternetError);
    }
  }

  Future<Either<String, DeleteChatModel>> delete(
      {required int translationid}) async {
    bool isConnectToInternet =
        await connectInternetHelper.checkInternetConnection();
    if (isConnectToInternet) {
      try {
        var response = await api.delete(
            endpoint: "${ApiEndPoint.deleteWordInChat}/$translationid",
            queryParameters: {
              ApiKeys.userid: userId,
            });
        if (response is ApiReponseSuccess) {
          return right(DeleteChatModel.fromJson(response.data));
        } else {
          return left(response.errormessage ?? StringManager.unExperctedError);
        }
      } catch (e) {
        log(e.toString());
        return left(StringManager.unExperctedError);
      }
    } else {
      return left(StringManager.noInternetError);
    }
  }
}
