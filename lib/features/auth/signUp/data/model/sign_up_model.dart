import 'package:graduate_project/core/network/api_keys.dart';

class SignUpModel {
  final String firstName;
  final String lastName;
  final String email;
  final String profilePictureUrl;
  final String password;
  final String confirmPassword;

  SignUpModel(
      {required this.firstName,
      required this.lastName,
      required this.email,
      required this.profilePictureUrl,
      required this.password,
      required this.confirmPassword});

  Map<String, dynamic> toMap() {
    return {
      ApiKeys.firstName: firstName,
      ApiKeys.lastName: lastName,
      ApiKeys.email: email,
      ApiKeys.profilePictureUrl: profilePictureUrl,
      ApiKeys.password: password,
      ApiKeys.confirmPassword: confirmPassword,
    };
  }
}



/*
{
  "firstName": "string",
  "lastName": "string",
  "email": "string",
  "profilePictureUrl": "string",
  "password": "string",
  "confirmPassword": "string"
}
*/