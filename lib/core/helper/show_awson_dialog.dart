import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:graduate_project/core/route/navigation_manager.dart';
import 'package:graduate_project/core/route/screen_manager.dart';

void showAwesonDialog(
    {required BuildContext context,
    required String title,
    required String subtitle}) {
  AwesomeDialog(
    context: context,
    dialogType: DialogType.success,
    animType: AnimType.rightSlide,
    title: title,
    desc: subtitle,
    btnOkOnPress: () {
      NavigationManager.pushReplace(
        context: context,
        screen: ScreenManager.loginView,
      );
    },
    dismissOnTouchOutside: false,
  ).show();
}
