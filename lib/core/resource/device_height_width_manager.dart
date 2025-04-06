import 'package:flutter/material.dart';

class DeviceHeightWidthManager {
  static const double designWidth = 438;
  static const double designHeight = 861;

  static double deviceWidth(BuildContext context) =>
      MediaQuery.of(context).size.width;
  static double deviceHight(BuildContext context) =>
      MediaQuery.of(context).size.height;

  static double subOfHeight(BuildContext context, double desHeight) {
    double height = (desHeight * deviceHight(context)) / designHeight;

    return height;
  }

  static double subOfWidth(BuildContext context, double desWidth) {
    double width = (desWidth * deviceWidth(context)) / desWidth;

    return width;
  }
}

abstract class HeightOfDesign {
  static const double h42 = 42;
  static const double h51 = 51;
  static const double h294 = 294;
  static const double h309 = 309;
  static const double h313 = 313;
  static const double h319 = 319;
}

abstract class WidthOfDesign {
  static const double w35 = 35;
  static const double w299 = 299;
  static const double w364 = 364;
  static const double w378 = 378;
}

abstract class HeightExternal {
  static double keyBoardHeight(BuildContext context) =>
      MediaQuery.of(context).viewInsets.bottom;
}
