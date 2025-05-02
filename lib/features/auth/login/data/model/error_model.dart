import 'package:graduate_project/core/network/api_keys.dart';

class ErrorModel {
  final int code;
  final String message;

  ErrorModel({required this.code, required this.message});

  factory ErrorModel.fromJson(Map<String, dynamic> json) {
    return ErrorModel(code: json[ApiKeys.code], message: json[ApiKeys.message]);
  }
}
