import 'package:dartz/dartz.dart';
import 'package:graduate_project/core/helper/connect_internet_helper.dart';
import 'package:graduate_project/core/network/api_end_point.dart';
import 'package:graduate_project/core/network/api_helper.dart';
import 'package:graduate_project/core/resource/string_manager.dart';
import 'package:graduate_project/features/bridge/data/model/all_bridge_chat_model.dart';
import 'package:graduate_project/features/signGPT/data/model/chat_model.dart';

import '../../../../core/model/api_response.dart';

class GetAllBridgeChatRepo {
  final ApiHelper apiHelper;
  final ConnectInternetHelper connectInternetHelper;

  GetAllBridgeChatRepo(
      {required this.apiHelper, required this.connectInternetHelper});

  Future<Either<String, List<Messages>>> getAllBridgeChat() async {
    bool isConnect = await connectInternetHelper.checkInternetConnection();
    if (isConnect) {
      try {
        var response =
            await apiHelper.get(endpoint: ApiEndPoint.getbridgeconversation);
        if (response is ApiReponseSuccess) {
          AllBridgeChatModel model = AllBridgeChatModel.fromJson(response.data);
          return right(model.messages);
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
