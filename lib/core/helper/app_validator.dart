import 'package:graduate_project/core/helper/app_regex.dart';
import 'package:graduate_project/core/resource/string_manager.dart';

abstract class AppValidator {
  static String? emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return StringManager.pleaseEnterYourEmail;
    } else if (!AppRegex.isEmailValid(value)) {
      return StringManager.emailnotgoodformate;
    } else {
      return null;
    }
  }

  static String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return StringManager.pleaseEnterYourPassword;
    } else if (!AppRegex.isPasswordValid(value)) {
      return StringManager.pleaseEnterValidatePasswod;
    } else {
      return null;
    }
  }

  static String? confirmPasswordValidator(String? value, String? match) {
    if (value == null || value.isEmpty) {
      return StringManager.pleaseEnterConfirmPassword;
    } else if (value != match) {
      return StringManager.confirmPasswordnotMatch;
    } else {
      return null;
    }
  }
}
