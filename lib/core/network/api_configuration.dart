import 'package:dio/dio.dart';
import 'package:graduate_project/core/network/api_keys.dart';
import 'package:graduate_project/core/storage/shared_preference_helper.dart';

class ApiConfiguration {
  static final SharedPreferenceHelper _sharedPreferenceHelper =
      SharedPreferenceHelper();
  static BaseOptions option = BaseOptions(
    // baseUrl: ApiEndPoint.baseUrlOriginal,
    receiveTimeout: Duration(minutes: 1),
    sendTimeout: Duration(minutes: 1),
    headers: {
      ApiKeys.authorization:
          '${ApiKeys.bearer} ${_sharedPreferenceHelper.getDataString(key: ApiKeys.token)}',
    },
  );
}
