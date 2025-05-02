import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduate_project/core/helper/app_validator.dart';
import 'package:graduate_project/features/auth/signUp/data/model/sign_up_model.dart';
import 'package:graduate_project/features/auth/signUp/data/repo/sigin_up_repo.dart';
import 'package:graduate_project/features/auth/signUp/manager/cubit/sigin_up_state.dart';

class SiginUpCubit extends Cubit<SiginUpState> {
  SiginUpCubit({required this.repo}) : super(SiginUpInitial());

  static SiginUpCubit get(context) => BlocProvider.of(context);

  GlobalKey<FormState> globalKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  TextEditingController emailCotroller = TextEditingController();
  TextEditingController firstNameCotroller = TextEditingController();
  TextEditingController lastNameCotroller = TextEditingController();
  TextEditingController passwordCotroller = TextEditingController();
  TextEditingController confirmPasswordCotroller = TextEditingController();

  final SiginUpRepo repo;

  String? confirmPasswordValidator(String? message) {
    return AppValidator.confirmPasswordValidator(
        message, passwordCotroller.text);
  }

  void onTap() async {
    emit(SiginUpLoading());
    if (globalKey.currentState!.validate()) {
      var response = await repo.siginUp(
        data: SignUpModel(
          firstName: firstNameCotroller.text,
          lastName: lastNameCotroller.text,
          email: emailCotroller.text,
          profilePictureUrl: "",
          password: passwordCotroller.text,
          confirmPassword: confirmPasswordCotroller.text,
        ),
      );

      response.fold((error) {
        emit(SiginUpFailing(
          errMessage: error,
        ));
      }, (r) {
        emit(SiginUpSuccess(
          email: emailCotroller.text,
        ));
      });
    } else {
      autovalidateMode = AutovalidateMode.always;
      emit(SiginUpNotValidate());
    }
  }
}
