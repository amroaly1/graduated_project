import 'package:graduate_project/core/network/api_keys.dart';

class ResponseFromApi {
  final bool isSuccess;
  final Error error;

  ResponseFromApi({required this.isSuccess, required this.error});

  factory ResponseFromApi.fromJson(Map<String, dynamic> json) {
    return ResponseFromApi(
        isSuccess: json[ApiKeys.isSuccess],
        error: Error.fromJson(json[ApiKeys.error]));
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data[ApiKeys.isSuccess] = isSuccess;
    data[ApiKeys.error] = error.toJson();
    return data;
  }
}

class Error {
  final int code;
  final String message;

  Error({required this.code, required this.message});

  factory Error.fromJson(Map<String, dynamic> json) {
    return Error(
      code: json[ApiKeys.code],
      message: json[ApiKeys.message],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data[ApiKeys.code] = code;
    data[ApiKeys.message] = message;
    return data;
  }
}
