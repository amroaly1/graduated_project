import 'package:dartz/dartz.dart';
import 'package:graduate_project/core/helper/connect_internet_helper.dart';
import 'package:graduate_project/core/model/api_response.dart';
import 'package:graduate_project/core/network/api_end_point.dart';
import 'package:graduate_project/core/network/api_helper.dart';
import 'package:graduate_project/core/network/api_keys.dart';
import 'package:graduate_project/core/resource/string_manager.dart';
import 'package:graduate_project/core/storage/shared_preference_helper.dart';
import 'package:graduate_project/features/saving/data/model/video_to_audio_save_model.dart';

class VideoToAudioSaveRepo {
  final ApiHelper apiHelper;
  final ConnectInternetHelper connectInternetHelper;

  VideoToAudioSaveRepo(
      {required this.apiHelper, required this.connectInternetHelper});

  Future<Either<String, VideoToAudioSaveModel>> getVideoToAudioSave() async {
    bool connected = await connectInternetHelper.checkInternetConnection();
    if (connected) {
      try {
        var response = await apiHelper.get(
            endpoint:
                "${ApiEndPoint.baseUrl2}/user/${getUserId()}/translations/with-audio");
        if (response is ApiReponseSuccess) {
          return right(VideoToAudioSaveModel.fromJson(response.data));
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
    SharedPreferenceHelper sharedPreferenceHelper = SharedPreferenceHelper();
    return sharedPreferenceHelper.getData(key: ApiKeys.userId) ?? 0;
  }
}
