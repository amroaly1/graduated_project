import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduate_project/features/auth/login/manager/cubit/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  static LoginCubit get(context) => BlocProvider.of(context);

  GlobalKey<FormState> globalKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  TextEditingController emailCotroller = TextEditingController();
  TextEditingController passwordCotroller = TextEditingController();

  void onTap() {
    emit(LoginLoading());
    if (globalKey.currentState!.validate()) {
      emit(LoginSuccess());
    } else {
      autovalidateMode = AutovalidateMode.always;
      emit(LoginNotValidate());
    }
  }
}
