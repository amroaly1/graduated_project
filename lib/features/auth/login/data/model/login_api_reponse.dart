import 'package:graduate_project/core/network/api_keys.dart';
import 'package:graduate_project/features/auth/login/data/model/error_model.dart';
import 'package:graduate_project/features/auth/login/data/model/user_model.dart';

class LoginApiReponse {
  final bool isSuccess;
  final ErrorModel error;
  UserModel? user;

  LoginApiReponse({
    required this.isSuccess,
    required this.error,
    this.user,
  });

  factory LoginApiReponse.fromJson(Map<String, dynamic> json) {
    if (json[ApiKeys.isSuccess]) {
      return LoginApiReponse(
        isSuccess: json[ApiKeys.isSuccess],
        error: ErrorModel.fromJson(json[ApiKeys.error]),
        user: UserModel.fromJson(json[ApiKeys.data]),
      );
    } else {
      return LoginApiReponse(
          isSuccess: json[ApiKeys.isSuccess],
          error: ErrorModel.fromJson(json[ApiKeys.error]));
    }
  }
}
