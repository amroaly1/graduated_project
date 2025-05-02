import 'package:graduate_project/core/network/api_keys.dart';

class SignUpReponseModel {
  final bool isSuccess;
  final int errorCode;
  final String message;

  SignUpReponseModel(
      {required this.isSuccess,
      required this.errorCode,
      required this.message});

  factory SignUpReponseModel.fromJson(Map<String, dynamic> json) {
    return SignUpReponseModel(
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
