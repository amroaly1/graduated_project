// ignore_for_file: depend_on_referenced_packages, unnecessary_import

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduate_project/core/helper/app_validator.dart';
import 'package:graduate_project/core/resource/string_manager.dart';
import 'package:graduate_project/features/auth/reset_password/data/repo/reset_password_repo.dart';
import 'package:meta/meta.dart';

part 'reset_password_state.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  ResetPasswordCubit({required this.repo}) : super(ResetPasswordInitial());

  final ResetPasswordRepo repo;

  static ResetPasswordCubit get(context) => BlocProvider.of(context);

  // form

  late GlobalKey<FormState> globalKey;
  late AutovalidateMode autovalidateMode;

  //controller
  late TextEditingController newPasswordController;
  late TextEditingController enterCodeController;
  late TextEditingController newConfrimPasswordController;

  // variable

  late String email;

  void init({required String email}) {
    globalKey = GlobalKey();
    this.email = email;
    autovalidateMode = AutovalidateMode.disabled;
    newPasswordController = TextEditingController();
    enterCodeController = TextEditingController();
    newConfrimPasswordController = TextEditingController();
  }

  void dispose() {
    newPasswordController.dispose();
    enterCodeController.dispose();
    newConfrimPasswordController.dispose();
  }

  String? confirmPassword(String? value) {
    return AppValidator.confirmPasswordValidator(
        value, newPasswordController.text);
  }

  String? codeValidator(String? value) {
    if (value == null || value.isEmpty) {
      return StringManager.pleaseEnterCode;
    } else if (value.length <= 5) {
      return StringManager.codeMustBe6;
    } else {
      return null;
    }
  }

  void onTap() async {
    emit(ResetPasswordLoading());

    if (globalKey.currentState!.validate()) {
      var response = await repo.resetPassowrd(
          code: enterCodeController.text,
          email: email,
          newPassword: newPasswordController.text);
      response.fold((error) {
        emit(ResetPasswordFailing(errMessage: error));
      }, (right) {
        emit(ResetPasswordSuccess());
      });
    } else {
      autovalidateMode = AutovalidateMode.always;
      emit(ResetPasswordNotValidate());
    }
  }
}
