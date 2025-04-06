import 'package:flutter/material.dart';

abstract class NavigationManager {
  static void push({required BuildContext context, required String screen}) {
    Navigator.pushNamed(context, screen);
  }

  static void pushReplace(
      {required BuildContext context, required String screen}) {
    Navigator.pushReplacementNamed(context, screen);
  }

  static void pop({required BuildContext context}) {
    Navigator.pop(context);
  }

  static void pushNameAndReplaseUnti(
      {required BuildContext context, required String screen}) {
    Navigator.of(context)
        .pushNamedAndRemoveUntil(screen, (Route<dynamic> route) => false);
  }
}
