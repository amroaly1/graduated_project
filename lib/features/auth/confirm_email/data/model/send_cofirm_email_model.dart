import 'package:graduate_project/core/network/api_keys.dart';

class SendCofirmEmailModel {
  final bool isSuccess;
  final int errorCode;
  final String message;

  SendCofirmEmailModel(
      {required this.isSuccess,
      required this.errorCode,
      required this.message});

  factory SendCofirmEmailModel.fromJson(Map<String, dynamic> json) {
    return SendCofirmEmailModel(
      isSuccess: json[ApiKeys.isSuccess],
      errorCode: json[ApiKeys.error][ApiKeys.code],
      message: json[ApiKeys.error][ApiKeys.message],
    );
  }
}

/*
  {
  "isSuccess": true,
  "error": {
    "code": 0,
    "message": "string"
  }
}
*/
