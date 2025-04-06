import 'package:flutter/material.dart';
import 'package:graduate_project/core/resource/color_manager.dart';
import 'package:graduate_project/core/resource/font_family_manger.dart';
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
  static TextStyle semiBold16({
    String? fontFamily = FontFamilyManger.avenirLTStd,
    Color color = ColorManager.gray2,
  }) =>
      TextStyle(
        fontFamily: fontFamily,
        fontWeight: FontWeightManager.semiBold,
        fontSize: FontSizeManager.s16,
        color: color,
      );

  static TextStyle bold19({
    String? fontFamily = FontFamilyManger.avenirLTStd,
    Color color = ColorManager.black,
    List<Shadow>? shadows,
  }) =>
      TextStyle(
        fontFamily: fontFamily,
        fontWeight: FontWeightManager.bold,
        fontSize: FontSizeManager.s19,
        color: color,
        shadows: shadows,
      );
  static TextStyle bold20({
    String? fontFamily = FontFamilyManger.avenirLTStd,
    Color color = ColorManager.gray2,
    List<Shadow>? shadows,
  }) =>
      TextStyle(
        fontFamily: fontFamily,
        fontWeight: FontWeightManager.bold,
        fontSize: FontSizeManager.s20,
        color: color,
        shadows: shadows,
      );
  static TextStyle light24({
    String? fontFamily = FontFamilyManger.avenirLTStd,
    Color color = ColorManager.purple1Color,
    List<Shadow>? shadows,
  }) =>
      TextStyle(
        fontFamily: fontFamily,
        fontWeight: FontWeightManager.light,
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
  static TextStyle black32({
    String? fontFamily,
    Color color = ColorManager.black1Color,
  }) =>
      TextStyle(
        fontFamily: fontFamily,
        fontWeight: FontWeightManager.black,
        fontSize: FontSizeManager.s32,
        color: color,
      );
  static TextStyle black40({
    String? fontFamily,
    Color color = ColorManager.primaryColor,
  }) =>
      TextStyle(
        fontFamily: fontFamily,
        fontWeight: FontWeightManager.black,
        fontSize: FontSizeManager.s40,
        color: color,
      );
  static TextStyle black16({
    String? fontFamily = FontFamilyManger.avenirLTStd,
    Color color = ColorManager.primaryColor,
  }) =>
      TextStyle(
        fontFamily: fontFamily,
        fontWeight: FontWeightManager.black,
        fontSize: FontSizeManager.s16,
        color: color,
      );
  static TextStyle black36({
    String? fontFamily,
    Color color = ColorManager.black,
  }) =>
      TextStyle(
        fontFamily: fontFamily,
        fontWeight: FontWeightManager.black,
        fontSize: FontSizeManager.s36,
        color: color,
      );
  static TextStyle bold16({
    String? fontFamily = FontFamilyManger.avenirLTStd,
    Color color = ColorManager.black,
  }) =>
      TextStyle(
        fontFamily: fontFamily,
        fontWeight: FontWeightManager.bold,
        fontSize: FontSizeManager.s16,
        color: color,
      );
  static TextStyle bold14({
    String? fontFamily = FontFamilyManger.avenirLTStd,
    Color color = ColorManager.black,
  }) =>
      TextStyle(
        fontFamily: fontFamily,
        fontWeight: FontWeightManager.bold,
        fontSize: FontSizeManager.s14,
        color: color,
      );
  static TextStyle bold12({
    String? fontFamily = FontFamilyManger.avenirLTStd,
    Color color = ColorManager.gray1,
  }) =>
      TextStyle(
        fontFamily: fontFamily,
        fontWeight: FontWeightManager.bold,
        fontSize: FontSizeManager.s12,
        color: color,
      );
}
