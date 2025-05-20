import 'package:dio/dio.dart';
import 'package:graduate_project/core/network/api_end_point.dart';

class ApiConfiguration {
  static BaseOptions option = BaseOptions(
    baseUrl: ApiEndPoint.baseUrl,
    receiveTimeout: Duration(seconds: 10),
    sendTimeout: Duration(seconds: 10),
  );
}
