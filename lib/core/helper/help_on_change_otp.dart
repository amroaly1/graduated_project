import 'package:flutter/material.dart';

void onChnageOtp(
    {required String value,
    required bool isFirst,
    required bool isLast,
    required BuildContext context}) {
  {
    if (value.isNotEmpty && isLast == false) {
      FocusScope.of(context).nextFocus();
    }
    if (value.isEmpty && isFirst == false) {
      FocusScope.of(context).previousFocus();
    }
  }
}
