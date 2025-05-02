import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduate_project/features/auth/login/data/repo/login_repo.dart';
import 'package:graduate_project/features/auth/login/manager/cubit/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.repo) : super(LoginInitial());
  final LoginRepo repo;
  static LoginCubit get(context) => BlocProvider.of(context);

  GlobalKey<FormState> globalKey = GlobalKey();
  late AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  late TextEditingController emailCotroller = TextEditingController();
  late TextEditingController passwordCotroller = TextEditingController();

  // void init() {
  //   emailCotroller = TextEditingController();
  //   passwordCotroller = TextEditingController();
  //   autovalidateMode = AutovalidateMode.disabled;
  // }

  // void disposeControllers() {
  //   emailCotroller.dispose();
  //   passwordCotroller.dispose();
  // }

  void onTap() async {
    emit(LoginLoading());
    if (globalKey.currentState!.validate()) {
      var response = await repo.login(
          email: emailCotroller.text, password: passwordCotroller.text);

      response.fold((ifLeft) {
        if (ifLeft.isEmailNoConfirm) {
          emit(LoginEmailNotConfirm(
              email: emailCotroller.text, errMessage: ifLeft.errMessage));
        } else {
          emit(LoginFailing(errMessage: ifLeft.errMessage));
        }
      }, (ifRight) {
        emit(LoginSuccess());
      });
    } else {
      autovalidateMode = AutovalidateMode.always;
      emit(LoginNotValidate());
    }
  }
}
