import 'package:dio/dio.dart';
import 'package:graduate_project/core/model/api_response.dart';
import 'package:graduate_project/core/network/api_configuration.dart';
import 'package:graduate_project/core/network/api_interceptor.dart';
import 'package:graduate_project/core/network/handel_dio_exception.dart';

class ApiHelper {
  final Dio _dio;

  ApiHelper({required Dio dio}) : _dio = dio {
    dio.options = ApiConfiguration.option;
    dio.interceptors.add(ApiInterceptor());
    dio.interceptors.add(
      LogInterceptor(
        request: true,
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
        responseBody: true,
        error: true,
      ),
    );
  }

  Future<ApiResponse> post({
    required String endpoint,
    Map<String, dynamic>? data,
    bool isForm = false,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      var response = await _dio.post(
        endpoint,
        data: isForm ? FormData.fromMap(data ?? {}) : data,
        queryParameters: queryParameters,
        options: Options(),
      );

      return ApiReponseSuccess(data: response.data);
    } on DioException catch (e) {
      return handelDioExeption(e: e);
    }
  }

  Future<ApiResponse> patch({
    required String endpoint,
    required Map<String, dynamic> data,
    bool isForm = false,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      var response = await _dio.patch(
        endpoint,
        data: isForm ? FormData.fromMap(data) : data,
        queryParameters: queryParameters,
        options: Options(),
      );

      return ApiReponseSuccess(data: response.data);
    } on DioException catch (e) {
      return handelDioExeption(e: e);
    }
  }

  Future<ApiResponse> get({
    required String endpoint,
    Map<String, dynamic>? data,
    bool isForm = false,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      var response = await _dio.get(
        endpoint,
        data: data == null
            ? null
            : isForm
                ? FormData.fromMap(data)
                : data,
        queryParameters: queryParameters,
        options: Options(),
      );

      return ApiReponseSuccess(data: response.data);
    } on DioException catch (e) {
      return handelDioExeption(e: e);
    }
  }
}
