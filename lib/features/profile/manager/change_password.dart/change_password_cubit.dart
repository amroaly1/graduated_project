import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduate_project/features/profile/data/repo/change_password_repo.dart';
// ignore: depend_on_referenced_packages, unnecessary_import
import 'package:meta/meta.dart';

part 'change_password_state.dart';

class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  ChangePasswordCubit(this.repo) : super(ChangePasswordInitial());

  final ChangePasswordRepo repo;

  static ChangePasswordCubit get(context) => BlocProvider.of(context);

  late TextEditingController currentPasswordController;
  late TextEditingController newPasswordController;
  late TextEditingController confirmPasswordController;

  late GlobalKey<FormState> formKey;
  late AutovalidateMode autovalidateMode;

  void init() {
    formKey = GlobalKey<FormState>();
    autovalidateMode = AutovalidateMode.disabled;
    currentPasswordController = TextEditingController();
    newPasswordController = TextEditingController();
    confirmPasswordController = TextEditingController();
  }

  void onTapChange() async {
    emit(ChangePasswordLoading());

    if (formKey.currentState!.validate()) {
      var response = await repo.changePassword(
        oldPassword: currentPasswordController.text,
        newPassword: newPasswordController.text,
      );
      response.fold((error) {
        emit(ChangePasswordFailing(erroMessage: error));
      }, (right) {
        emit(ChangePasswordSuccess());
      });
    } else {
      autovalidateMode = AutovalidateMode.always;
      emit(ChangePasswordValidatorFailing());
    }
  }
}
