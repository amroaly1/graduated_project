import 'package:dartz/dartz.dart';
import 'package:graduate_project/core/helper/connect_internet_helper.dart';
import 'package:graduate_project/core/helper/upload_image_to_api.dart';
import 'package:graduate_project/core/model/api_response.dart';
import 'package:graduate_project/core/network/api_end_point.dart';
import 'package:graduate_project/core/network/api_helper.dart';
import 'package:graduate_project/core/network/api_keys.dart';
import 'package:graduate_project/core/resource/string_manager.dart';
import 'package:graduate_project/features/profile/data/model/response_upload_image_to_server.dart';
import 'package:image_picker/image_picker.dart';

class EditProfileRepo {
  final ApiHelper apiHelper;
  final ConnectInternetHelper connectInternetHelper;
  EditProfileRepo({
    required this.apiHelper,
    required this.connectInternetHelper,
  });
  Future<Either<String, String>> uploadImageToServer(XFile image) async {
    bool isConnect = await connectInternetHelper.checkInternetConnection();

    if (isConnect) {
      try {
        final file = await uploadImageToApi(image);
        var response = await apiHelper.post(
            endpoint: ApiEndPoint.uploadImageProfile,
            isForm: true,
            data: {
              ApiKeys.file: file
            },
            queryParameters: {
              ApiKeys.folder: "Images",
            });

        if (response is ApiReponseSuccess) {
          ResponseUploadImageToServer responseUploadImageToServer =
              ResponseUploadImageToServer.fromJson(response.data);
          return right(
            responseUploadImageToServer.data.fileUrl,
          );
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

  Future<Either<String, void>> updateProfile(
      {required String firstname,
      required String lastname,
      required imageurl}) async {
    bool isConnect = await connectInternetHelper.checkInternetConnection();
    if (isConnect) {
      try {
        var response =
            await apiHelper.put(endpoint: ApiEndPoint.editProfile, data: {
          ApiKeys.firstName: firstname,
          ApiKeys.lastName: lastname,
          ApiKeys.profilePictureUrl: imageurl,
        });
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
