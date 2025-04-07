import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduate_project/core/helper/app_validator.dart';
import 'package:graduate_project/features/auth/signUp/manager/cubit/sigin_up_state.dart';

class SiginUpCubit extends Cubit<SiginUpState> {
  SiginUpCubit() : super(SiginUpInitial());

  static SiginUpCubit get(context) => BlocProvider.of(context);

  GlobalKey<FormState> globalKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  TextEditingController emailCotroller = TextEditingController();
  TextEditingController passwordCotroller = TextEditingController();
  TextEditingController confirmPasswordCotroller = TextEditingController();

  String? confirmPasswordValidator(String? message) {
    return AppValidator.confirmPasswordValidator(
        message, passwordCotroller.text);
  }

  void onTap() {
    emit(SiginUpLoading());
    if (globalKey.currentState!.validate()) {
      emit(SiginUpSuccess());
    } else {
      autovalidateMode = AutovalidateMode.always;
      emit(SiginUpNotValidate());
    }
  }
}
