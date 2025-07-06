import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:graduate_project/core/helper/connect_internet_helper.dart';
import 'package:graduate_project/core/helper/upload_image_to_api.dart';
import 'package:graduate_project/core/model/api_response.dart';
import 'package:graduate_project/core/network/api_end_point.dart';
import 'package:graduate_project/core/network/api_helper.dart';
import 'package:graduate_project/core/network/api_keys.dart';
import 'package:graduate_project/core/resource/string_manager.dart';
import 'package:graduate_project/core/storage/shared_preference_helper.dart';
import 'package:image_picker/image_picker.dart';

class UploadVideoRepo {
  final ApiHelper apiHelper;
  final ConnectInternetHelper connectInternetHelper;

  UploadVideoRepo(
      {required this.apiHelper, required this.connectInternetHelper});

  Future<Either<String, void>> uploadVideo({
    required XFile image,
    required bool returnaudio,
  }) async {
    var connect = await connectInternetHelper.checkInternetConnection();
    if (connect) {
      try {
        final file = await uploadImageToApi(image);
        var response = await apiHelper
            .post(endpoint: ApiEndPoint.uploadVideo, isForm: true, data: {
          ApiKeys.file: file,
          ApiKeys.clientid: getUserId(),
          ApiKeys.useridUploadVideo: getUserId(),
          ApiKeys.returnaudio: returnaudio,
        });
        if (response is ApiReponseSuccess) {
          return right(null);
        } else {
          log("${response.errormessage ?? StringManager.unExperctedError}");
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
    SharedPreferenceHelper sharedPreferenceHelper = SharedPreferenceHelper();
    return sharedPreferenceHelper.getData(key: ApiKeys.userId) ?? 0;
  }
}
