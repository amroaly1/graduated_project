import 'dart:convert';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:graduate_project/core/helper/connect_internet_helper.dart';
import 'package:graduate_project/core/model/api_response.dart';
import 'package:graduate_project/core/network/api_end_point.dart';
import 'package:graduate_project/core/network/api_helper.dart';
import 'package:graduate_project/core/network/api_keys.dart';
import 'package:graduate_project/core/resource/string_manager.dart';
import 'package:graduate_project/features/dictionary/data/model/api_reponse.dart';
import 'package:graduate_project/features/dictionary/data/model/data_from_repo.dart';
import 'package:graduate_project/features/dictionary/data/model/dictionary_item_model.dart';
import 'package:graduate_project/features/dictionary/data/model/error_reponse.dart';
import 'package:graduate_project/features/dictionary/data/model/map_of_character.dart';
import 'package:graduate_project/features/dictionary/data/repo/dictionary_add_favorite_repo.dart';

class SignDictionaryRepo {
  List<MapOfCharacter> data = [];
  final ApiHelper apiHelper;
  final ConnectInternetHelper connectInternetHelper;
  final DictionaryAddFavoriteRepo dictionaryAddFavoriteRepo;
  int pageNumber = 1;
  final int pageSize = 100;
  bool canLoading = true;

  SignDictionaryRepo({
    required this.dictionaryAddFavoriteRepo,
    required this.apiHelper,
    required this.connectInternetHelper,
  }) {
    inital();
  }

  Future<Either<ErrorReponse, DataFromRepo>> getData() async {
    log("Get All  Call");
    if (canLoading == false) {
      return left(ErrorReponse(
          message: StringManager.noDataMore, isFirstTime: noData()));
    }
    bool isConnectToInternet =
        await connectInternetHelper.checkInternetConnection();

    log(isConnectToInternet.toString());

    if (isConnectToInternet) {
      try {
        var response = await apiHelper.get(
            endpoint: ApiEndPoint.getAllDictionary,
            queryParameters: {
              ApiKeys.pageNumber: pageNumber,
              ApiKeys.pageSize: pageSize
            });

        if (response is ApiReponseSuccess) {
          ApiReponse res = ApiReponse.fromJson(response.data);
          addAllData(res.items);
          if (pageNumber * pageSize < res.totalCount) {
            pageNumber++;
            canLoading = true;
          } else {
            canLoading = false;
          }
          return right(
              DataFromRepo(data: returnHaveData(), canLoading: canLoading));
        } else {
          return left(ErrorReponse(
              message: response.errormessage ?? StringManager.unExperctedError,
              isFirstTime: noData()));
        }
      } catch (e) {
        return left(ErrorReponse(
            message: StringManager.unExperctedError, isFirstTime: noData()));
      }
    } else {
      return left(
        ErrorReponse(
          message: StringManager.noInternetError,
          isFirstTime: noData(),
          problemFromInternrt: true,
        ),
      );
    }
  }

  Future<Either<String, void>> addOrRemoveFavorite({required int id}) async {
    return dictionaryAddFavoriteRepo.favoriteAddOrRemove(id: id);
  }

  bool noData() {
    for (int i = 0; i < 26; i++) {
      if (data[i].data.isNotEmpty) {
        return false;
      }
    }
    return true;
  }

  void inital() {
    const asciiEncoder = AsciiEncoder();
    const asciiDecoder = AsciiDecoder();
    String x = 'A';
    var value = asciiEncoder.convert(x[0]);
    var val = asciiDecoder.convert(value);

    for (int i = 0; i < 26; i++) {
      data.add(MapOfCharacter(key: val, data: []));
      value[0]++;
      val = asciiDecoder.convert(value);
    }
  }

  void addData(DictionaryItemModel dictionary) {
    for (int i = 0; i < 26; i++) {
      if (data[i].key == dictionary.gloss[0].toUpperCase()) {
        data[i].data.add(dictionary);
      }
    }
  }

  void addAllData(List<DictionaryItemModel> dictionaries) {
    for (int i = 0; i < dictionaries.length; i++) {
      addData(dictionaries[i]);
    }
  }

  List<MapOfCharacter> returnHaveData() {
    List<MapOfCharacter> result = [];
    for (int i = 0; i < 26; i++) {
      if (data[i].data.isNotEmpty) {
        result.add(data[i]);
      }
    }
    return result;
  }

  DataFromRepo changeIsFaoriteData({required int id}) {
    List<MapOfCharacter> result = [];
    for (int i = 0; i < 26; i++) {
      if (data[i].data.isNotEmpty) {
        for (int j = 0; j < data[i].data.length; j++) {
          if (data[i].data[j].id == id) {
            data[i].data[j].isFavorite = !data[i].data[j].isFavorite;
            break;
          }
        }
        result.add(data[i]);
      }
    }
    return DataFromRepo(data: result, canLoading: canLoading);
  }
}
