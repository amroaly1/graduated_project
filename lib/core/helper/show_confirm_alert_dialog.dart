import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graduate_project/core/resource/color_manager.dart';
import 'package:graduate_project/core/resource/distance_manager.dart';
import 'package:graduate_project/core/resource/font_family_manger.dart';
import 'package:graduate_project/core/resource/icon_manager.dart';
import 'package:graduate_project/core/resource/text_style_manager.dart';
import 'package:graduate_project/core/widget/default_button.dart';

Future<dynamic> showConfirmAlertDialog(
    {required String title,
    required String subTitle,
    required String buttonText,
    required void Function()? onPressed,
    required BuildContext context}) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        icon: Container(
          height: HeightManager.h60,
          width: HeightManager.h60,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: ColorManager.primaryColor,
          ),
          child: SvgPicture.asset(
            IconManager.correcticon,
            fit: BoxFit.scaleDown,
          ),
        ),
        title: Text(
          title,
          style: TextStyleManager.black20(
            fontFamily: FontFamilyManger.avenirLTStd,
            color: ColorManager.black,
          ),
        ),
        content: Text(
          subTitle,
          style: TextStyleManager.bold14(
            fontFamily: FontFamilyManger.hvDTrialBrandonGrotesque,
            color: ColorManager.primaryColor,
          ),
          textAlign: TextAlign.center,
        ),
        actions: [
          SizedBox(
            width: double.infinity,
            child: DefaultButton(
              text: buttonText,
              onPressed: onPressed,
            ),
          ),
        ],
      );
    },
  );
}
