import 'package:graduate_project/core/network/api_keys.dart';

class UserModel {
  final int userId;
  final String email;
  final String token;
  final String refreshToken;
  final String tokenExpiry;
  final String refreshTokenExpiry;
  final String firstName;
  final String lastName;

  UserModel(
      {required this.userId,
      required this.email,
      required this.token,
      required this.refreshToken,
      required this.tokenExpiry,
      required this.refreshTokenExpiry,
      required this.firstName,
      required this.lastName});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      userId: json[ApiKeys.userId],
      email: json[ApiKeys.email],
      token: json[ApiKeys.token],
      refreshToken: json[ApiKeys.refreshToken],
      tokenExpiry: json[ApiKeys.tokenExpiry],
      refreshTokenExpiry: json[ApiKeys.refreshTokenExpiry],
      firstName: json[ApiKeys.firstName],
      lastName: json[ApiKeys.lastName],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data[ApiKeys.userId] = userId;
    data[ApiKeys.email] = email;
    data[ApiKeys.token] = token;
    data[ApiKeys.refreshToken] = refreshToken;
    data[ApiKeys.tokenExpiry] = tokenExpiry;
    data[ApiKeys.refreshTokenExpiry] = refreshTokenExpiry;
    return data;
  }
}
