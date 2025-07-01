import 'package:flutter/material.dart';
import 'package:graduate_project/core/resource/color_manager.dart';
import 'package:graduate_project/core/resource/font_family_manger.dart';
import 'package:graduate_project/core/resource/font_size_manager.dart';
import 'package:graduate_project/core/resource/font_weight_manager.dart';

abstract class TextStyleManager {
  static TextStyle medium24({
    String? fontFamily,
    Color color = ColorManager.primaryColor,
    double? fontSize,
    double? wordSpacing,
  }) =>
      TextStyle(
        fontFamily: fontFamily,
        fontWeight: FontWeightManager.meduim,
        fontSize: fontSize ?? FontSizeManager.s24,
        color: color,
        wordSpacing: wordSpacing,
      );
  static TextStyle medium14({
    String? fontFamily,
    Color color = ColorManager.black,
    double? size,
    double? height,
  }) =>
      TextStyle(
        fontFamily: fontFamily,
        fontWeight: FontWeightManager.meduim,
        fontSize: size ?? FontSizeManager.s14,
        color: color,
        height: height,
      );
  static TextStyle medium13({
    String? fontFamily,
    Color color = ColorManager.gray6,
    double? size,
    double? height,
  }) =>
      TextStyle(
        fontFamily: fontFamily,
        fontWeight: FontWeightManager.meduim,
        fontSize: size ?? FontSizeManager.s13,
        color: color,
        height: height,
      );
  static TextStyle medium20({
    String? fontFamily,
    Color color = ColorManager.black,
    double? size,
    double? height,
    FontWeight? fontWeight,
  }) =>
      TextStyle(
        fontFamily: fontFamily,
        fontWeight: fontWeight ?? FontWeightManager.meduim,
        fontSize: size ?? FontSizeManager.s20,
        color: color,
        height: height,
      );
  static TextStyle medium32({
    String? fontFamily,
    Color color = ColorManager.primaryColor,
    double? size,
  }) =>
      TextStyle(
        fontFamily: fontFamily,
        fontWeight: FontWeightManager.meduim,
        fontSize: size ?? FontSizeManager.s32,
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
  static TextStyle bold22({
    String? fontFamily = FontFamilyManger.avenirLTStd,
    Color color = ColorManager.black,
    List<Shadow>? shadows,
  }) =>
      TextStyle(
        fontFamily: fontFamily,
        fontWeight: FontWeightManager.bold,
        fontSize: FontSizeManager.s22,
        color: color,
        shadows: shadows,
      );
  static TextStyle black20({
    Color color = ColorManager.black1Color,
    String? fontFamily,
    List<Shadow>? shadows,
  }) =>
      TextStyle(
        fontFamily: fontFamily,
        fontWeight: FontWeightManager.black,
        fontSize: FontSizeManager.s20,
        color: color,
        shadows: shadows,
      );
  static TextStyle black24({
    String? fontFamily = FontFamilyManger.avenirLTStd,
    Color color = ColorManager.black,
    List<Shadow>? shadows,
  }) =>
      TextStyle(
        fontFamily: fontFamily,
        fontWeight: FontWeightManager.black,
        fontSize: FontSizeManager.s24,
        color: color,
        shadows: shadows,
      );
  static TextStyle light13({
    String? fontFamily = FontFamilyManger.avenirLTStd,
    Color color = ColorManager.black,
    List<Shadow>? shadows,
  }) =>
      TextStyle(
        fontFamily: fontFamily,
        fontWeight: FontWeightManager.light,
        fontSize: FontSizeManager.s13,
        color: color,
        shadows: shadows,
      );
  static TextStyle light14({
    String? fontFamily = FontFamilyManger.avenirLTStd,
    Color color = ColorManager.gray3,
    List<Shadow>? shadows,
  }) =>
      TextStyle(
        fontFamily: fontFamily,
        fontWeight: FontWeightManager.light,
        fontSize: FontSizeManager.s14,
        color: color,
        shadows: shadows,
      );
  static TextStyle light16({
    String? fontFamily = FontFamilyManger.avenirLTStd,
    Color color = ColorManager.gray3,
    List<Shadow>? shadows,
  }) =>
      TextStyle(
        fontFamily: fontFamily,
        fontWeight: FontWeightManager.light,
        fontSize: FontSizeManager.s16,
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
    double? fontSize,
  }) =>
      TextStyle(
        fontFamily: fontFamily,
        fontWeight: FontWeightManager.black,
        fontSize: fontSize ?? FontSizeManager.s32,
        color: color,
      );
  static TextStyle black40({
    String? fontFamily,
    Color color = ColorManager.primaryColor,
  }) =>
      TextStyle(
        fontFamily: fontFamily,
        fontWeight: FontWeightManager.black,
        fontSize: FontSizeManager.s32,
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
    TextDecoration? decoration,
    Color? decorationColor,
    double? decorationThickness,
    double? height,
  }) =>
      TextStyle(
        height: height,
        fontFamily: fontFamily,
        fontWeight: FontWeightManager.bold,
        fontSize: FontSizeManager.s16,
        color: color,
        decoration: decoration,
        decorationColor: decorationColor,
        decorationThickness: decorationThickness,
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

  static TextStyle bold24({
    String? fontFamily,
    Color color = ColorManager.black,
  }) =>
      TextStyle(
        fontFamily: fontFamily,
        fontWeight: FontWeightManager.bold,
        fontSize: FontSizeManager.s24,
        color: color,
      );
  static TextStyle bold26({
    String? fontFamily,
    Color color = ColorManager.black,
  }) =>
      TextStyle(
        fontFamily: fontFamily,
        fontWeight: FontWeightManager.bold,
        fontSize: FontSizeManager.s26,
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
