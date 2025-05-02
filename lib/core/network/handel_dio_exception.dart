import 'package:dio/dio.dart';
import 'package:graduate_project/core/model/api_response.dart';
import 'package:graduate_project/core/resource/string_manager.dart';

ApiResponseFailing handelDioExeption({required DioException e}) {
  switch (e.type) {
    case DioExceptionType.connectionTimeout:
    case DioExceptionType.sendTimeout:
    case DioExceptionType.receiveTimeout:
    case DioExceptionType.cancel:
    case DioExceptionType.connectionError:
      return ApiResponseFailing(
          errormessage: StringManager.noInternetError,
          isProblemFromInternrt: true);

    case DioExceptionType.badCertificate:
      return ApiResponseFailing(
        errormessage: "Bad certificate detected.",
        isProblemFromInternrt: false,
      );
    case DioExceptionType.badResponse:
      final statusCode = e.response?.statusCode;
      String errorMessage;

      if (statusCode != null) {
        if (statusCode >= 400 && statusCode < 500) {
          switch (statusCode) {
            case 400:
              errorMessage = "Bad request. Please try again.";
              break;
            case 401:
              errorMessage = "Unauthorized. Please login again.";
              break;
            case 403:
              errorMessage = "Forbidden. You don't have permission.";
              break;
            case 404:
              errorMessage = "Not found. The requested resource doesn't exist.";
              break;
            case 409:
              errorMessage = "Conflict. Please try again.";
              break;
            default:
              errorMessage = "Client error. Please check your request.";
          }
        } else if (statusCode >= 500) {
          errorMessage = "Server error. Please try again later.";
        } else {
          errorMessage = "Unexpected error. Please try again.";
        }
      } else {
        errorMessage = "Unknown server error.";
      }

      return ApiResponseFailing(
        errormessage: errorMessage,
        isProblemFromInternrt: false,
      );
    case DioExceptionType.unknown:
      bool shouldUseCache = false;

      if (e.message?.contains('SocketException') == true) {
        shouldUseCache = true;
      }

      return ApiResponseFailing(
        errormessage:
            "Something went wrong. Please check your internet connection or try again later.",
        isProblemFromInternrt: shouldUseCache,
      );
  }
}
