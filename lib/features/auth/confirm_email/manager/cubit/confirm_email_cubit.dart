import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduate_project/core/resource/string_manager.dart';
import 'package:graduate_project/features/auth/confirm_email/data/repo/confirm_email_repo.dart';
// ignore: depend_on_referenced_packages, unnecessary_import
import 'package:meta/meta.dart';

part 'confirm_email_state.dart';

class ConfirmEmailCubit extends Cubit<ConfirmEmailState> {
  ConfirmEmailCubit(this.repo) : super(ConfirmEmailInitial());

  final ConfirmEmailRepo repo;

  static ConfirmEmailCubit get(context) => BlocProvider.of(context);

  // form
  late GlobalKey<FormState> globalKey;
  late AutovalidateMode autovalidateMode;

  late String email;

  // controller
  late TextEditingController c1;
  late TextEditingController c2;
  late TextEditingController c3;
  late TextEditingController c4;
  late TextEditingController c5;
  late TextEditingController c6;

  // timer
  Timer? timer;

  late String timeSTring;
  int secondTime = 1;
  int scale = 5;
  bool sendMessage = false;

  void disposeControllers() {
    timer?.cancel();
    c1.dispose();
    c2.dispose();
    c3.dispose();
    c4.dispose();
    c5.dispose();
    c6.dispose();
  }

  void init({required String email}) async {
    timeSTring = "02:00";
    secondTime = 1;
    scale = 5;
    globalKey = GlobalKey();
    autovalidateMode = AutovalidateMode.disabled;
    c1 = TextEditingController();
    c2 = TextEditingController();
    c3 = TextEditingController();
    c4 = TextEditingController();
    c5 = TextEditingController();
    c6 = TextEditingController();
    this.email = email;
    resentCode();
  }

  void initialTimer() {
    if (sendMessage) {
      timer = Timer.periodic(Duration(seconds: 1), (time) {
        if (secondTime == 0) {
          time.cancel();
          if (!isClosed) {
            emit(ConfirmEmailEndFirstCountCount());
          }
        } else {
          secondTime--;
          timeSTring = formatDuration(secondTime);
          if (!isClosed) {
            emit(ConfirmEmailChangeCount());
          }
        }
      });
    }
  }

  @override
  Future<void> close() {
    timer?.cancel();
    return super.close();
  }

  Future<void> sendEmailConfirm(
      {required String email, bool isFirst = false}) async {
    var response = await repo.sendEmailConfirm(email: email);
    response.fold((ifLeft) {
      if (!isClosed) {
        // Check if Cubit is still open
        if (sendMessage) {
          emit(SendConfirmEmailFailing(errorMessage: ifLeft.errMessage));
        }
        if (ifLeft.isConnectInternet) {
          emit(SendConfirmEmailFirstTimeFailing(
              errorMessage: ifLeft.errMessage));
        } else {
          emit(SendConfirmEmailFirstTimeFailingNoInternet(
              errorMessage: StringManager.noInternetError));
        }
      }
    }, (ifRight) {
      if (!isClosed) {
        // Check if Cubit is still open
        sendMessage = true;
      }
    });
  }

  String formatDuration(int seconds) {
    final minutes = (seconds ~/ 60).toString().padLeft(2, '0');
    final secs = (seconds % 60).toString().padLeft(2, '0');
    return '$minutes:$secs';
  }

  // resent code
  void resentCode() async {
    if (secondTime == 1) {
      secondTime = 120;
    } else {
      secondTime = 120 * scale;
      scale = scale * 2;
    }
    await sendEmailConfirm(email: email, isFirst: true);
    initialTimer();
  }

  // send code
  void sendCode() async {
    emit(ConfirmEmailLoading());
    if (globalKey.currentState!.validate()) {
      log("\n---------------------------\n ${verificationCode()} \n---------------------------\n");
      var response = await repo.confirmEmail(
          email: email, verificationCode: verificationCode());

      response.fold((ifLeft) {
        emit(ConfirmEmailFailing(errorMessage: ifLeft));
      }, (ifRight) {
        emit(ConfirmEmailSuccess());
        // go to widget to handel this
      });
    } else {
      autovalidateMode = AutovalidateMode.always;
      emit(ConfirmEmailNoValidate(errorMessage: "Please Enter All Codes"));
    }
  }

  String verificationCode() {
    return c1.text + c2.text + c3.text + c4.text + c5.text + c6.text;
  }
}
