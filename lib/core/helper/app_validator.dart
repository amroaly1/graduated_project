import 'package:graduate_project/core/helper/app_regex.dart';
import 'package:graduate_project/core/resource/string_manager.dart';

abstract class AppValidator {
  static String? validate(String? value) {
    if (value == null || value.isEmpty) {
      return "";
    }

    return null;
  }

  static String? nameValidator(String? value, String text) {
    if (value == null || value.isEmpty) {
      return StringManager.pleaseEnterYourName + text.toLowerCase();
    } else if (value.length < 3) {
      return StringManager.yourNameShouldBe4Ch;
    } else {
      return null;
    }
  }

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
