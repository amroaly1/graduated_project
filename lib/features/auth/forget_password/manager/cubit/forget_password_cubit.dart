import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduate_project/core/resource/string_manager.dart';
import 'package:graduate_project/features/auth/forget_password/data/repo/forget_password_repo.dart';
// ignore: depend_on_referenced_packages, unnecessary_import
import 'package:meta/meta.dart';

part 'forget_password_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  ForgetPasswordCubit({required this.repo}) : super(ForgetPasswordInitial());

  final ForgetPasswordRepo repo;

  static ForgetPasswordCubit get(context) => BlocProvider.of(context);

  // form
  GlobalKey<FormState> globalKey = GlobalKey();
  late AutovalidateMode autovalidateMode;

  // controller
  late TextEditingController emailController;

  void init() {
    autovalidateMode = AutovalidateMode.disabled;
    emailController = TextEditingController();
  }

  void dispose() {
    emailController.dispose();
  }

  void onTap() async {
    emit(ForgetPasswordSendLoading());

    if (globalKey.currentState!.validate()) {
      var response =
          await repo.createPasswordResetToken(email: emailController.text);

      response.fold((ifLeft) {
        emit(ForgetPasswordSendFailing(
          errorMessage: ifLeft,
        ));
      }, (ifRight) {
        emit(ForgetPasswordSendSuccess(email: emailController.text));
      });
    } else {
      autovalidateMode = AutovalidateMode.always;
      emit(ForgetPasswordSendFailing(
          errorMessage: StringManager.emailnotgoodformate));
    }
  }
}
