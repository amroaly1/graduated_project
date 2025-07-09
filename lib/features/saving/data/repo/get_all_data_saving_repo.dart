import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:graduate_project/core/helper/connect_internet_helper.dart';
import 'package:graduate_project/core/model/api_response.dart';
import 'package:graduate_project/core/network/api_end_point.dart';
import 'package:graduate_project/core/network/api_helper.dart';
import 'package:graduate_project/core/network/api_keys.dart';
import 'package:graduate_project/core/resource/string_manager.dart';
import 'package:graduate_project/core/storage/shared_preference_helper.dart';
import 'package:graduate_project/features/saving/data/model/dictionary_saving_model.dart';
import 'package:graduate_project/features/saving/data/model/get_all_data_save_model.dart';

class GetAllDataSavingRepo {
  final ApiHelper apiHelper;
  final ConnectInternetHelper connectInternetHelper;

  GetAllDataSavingRepo(
      {required this.apiHelper, required this.connectInternetHelper});

  Future<Either<String, GetAllDataModel>> getAllData() async {
    bool connected = await connectInternetHelper.checkInternetConnection();
    if (connected) {
      try {
        var response = await apiHelper.get(
            endpoint:
                "${ApiEndPoint.baseUrlSecondary}/user/${getUserId()}/saved/all");
        if (response is ApiReponseSuccess) {
          GetAllDataModel getAllDataModel =
              GetAllDataModel.fromJson(response.data);
          try {
            var re = await apiHelper.get(
                endpoint: ApiEndPoint.getAllDictionaryFavorites);
            if (re is ApiReponseSuccess) {
              List<DictionarySavingModel> list = (re.data as List)
                  .map((e) => DictionarySavingModel.fromJson(e))
                  .toList();

              log(list.toString());

              for (var element in list) {
                getAllDataModel.translations.add(
                  Translations(
                    id: element.id.toString(),
                    dictionaryEntryId: element.dictionaryEntryId,
                    gloss: element.gloss,
                    videoUrld: element.videoUrl,
                    favoritedOn: element.favoritedOn,
                  ),
                );
              }
              sortTranslationsByTime(getAllDataModel.translations);
              return right(getAllDataModel);
            } else {
              return left(
                  response.errormessage ?? StringManager.unExperctedError);
            }
          } catch (e) {
            return left(StringManager.unExperctedError);
          }
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

  void sortTranslationsByTime(List<Translations> list) {
    list.sort((a, b) {
      DateTime parseTime(Translations t) {
        final timeStr = t.timestamp ?? t.savedAt ?? t.favoritedOn;
        return timeStr != null
            ? DateTime.parse(timeStr)
            : DateTime.fromMillisecondsSinceEpoch(0);
      }

      return parseTime(b).compareTo(parseTime(a)); // Descending
    });
  }
}
