import 'package:dartz/dartz.dart';
import 'package:graduate_project/core/helper/connect_internet_helper.dart';
import 'package:graduate_project/core/model/api_response.dart';
import 'package:graduate_project/core/network/api_end_point.dart';
import 'package:graduate_project/core/network/api_helper.dart';
import 'package:graduate_project/core/network/api_keys.dart';
import 'package:graduate_project/core/resource/string_manager.dart';
import 'package:graduate_project/features/dictionary/data/model/api_reponse.dart';
import 'package:graduate_project/features/dictionary/data/model/dictionary_item_model.dart';
import 'package:graduate_project/features/dictionary/data/model/error_reponse.dart';

class DictionarySearchRepo {
  final ApiHelper api;
  final ConnectInternetHelper connectInternetHelper;

  DictionarySearchRepo(
      {required this.api, required this.connectInternetHelper});

  Future<Either<ErrorReponse, List<DictionaryItemModel>>> search(
      {required String searchTerm, required int searchType}) async {
    bool isConnectToInternet =
        await connectInternetHelper.checkInternetConnection();

    if (isConnectToInternet) {
      try {
        var response = await api.post(
          endpoint: ApiEndPoint.searchInDictionary,
          data: dataSendFormate(searchTerm: searchTerm, searchType: searchType),
        );

        if (response is ApiReponseSuccess) {
          ApiReponse res = ApiReponse.fromJson(response.data);

          return right(res.items);
        } else {
          return left(ErrorReponse(
              message: response.errormessage ?? StringManager.unExperctedError,
              isFirstTime: false));
        }
      } catch (e) {
        return left(ErrorReponse(
            message: StringManager.unExperctedError, isFirstTime: false));
      }
    } else {
      return left(
        ErrorReponse(
          message: StringManager.noInternetError,
          isFirstTime: false,
          problemFromInternrt: true,
        ),
      );
    }
  }

  Map<String, dynamic> dataSendFormate(
      {required String searchTerm, required int searchType}) {
    return {
      ApiKeys.searchTerm: searchTerm,
      ApiKeys.searchType: searchType,
      ApiKeys.paginationParams: {
        ApiKeys.pageNumber: 1,
        ApiKeys.pageSize: 100,
      },
    };
  }
}
