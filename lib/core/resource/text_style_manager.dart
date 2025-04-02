import 'package:flutter/material.dart';
import 'package:graduate_project/core/resource/color_manager.dart';
import 'package:graduate_project/core/resource/font_size_manager.dart';
import 'package:graduate_project/core/resource/font_weight_manager.dart';

abstract class TextStyleManager {
  static TextStyle medium24({
    String? fontFamily,
    Color color = ColorManager.primaryColor,
  }) =>
      TextStyle(
        fontFamily: fontFamily,
        fontWeight: FontWeightManager.meduim,
        fontSize: FontSizeManager.s24,
        color: color,
      );

  static TextStyle regular17({
    String? fontFamily,
    Color? color,
    List<Shadow>? shadows,
  }) =>
      TextStyle(
        fontFamily: fontFamily,
        fontWeight: FontWeightManager.regular,
        fontSize: FontSizeManager.s17,
        color: color ?? ColorManager.blackwithOpacity70,
        shadows: shadows,
      );

  static TextStyle regular24({
    String? fontFamily,
    Color color = ColorManager.purple1Color,
    List<Shadow>? shadows,
  }) =>
      TextStyle(
        fontFamily: fontFamily,
        fontWeight: FontWeightManager.regular,
        fontSize: FontSizeManager.s24,
        color: color,
        shadows: shadows,
      );
  static TextStyle light32({
    String? fontFamily,
    Color color = ColorManager.whight,
    double? height,
  }) =>
      TextStyle(
        fontFamily: fontFamily,
        fontWeight: FontWeightManager.light,
        fontSize: FontSizeManager.s32,
        color: color,
        height: height,
      );
  static TextStyle semiBold24({
    String? fontFamily,
    Color color = ColorManager.whight,
    double? height,
  }) =>
      TextStyle(
        fontFamily: fontFamily,
        fontWeight: FontWeightManager.semiBold,
        fontSize: FontSizeManager.s24,
        color: color,
        height: height,
      );
  static TextStyle bold32({
    String? fontFamily,
    Color color = ColorManager.black1Color,
  }) =>
      TextStyle(
        fontFamily: fontFamily,
        fontWeight: FontWeightManager.bold,
        fontSize: FontSizeManager.s32,
        color: color,
      );
}
