import 'package:flutter/material.dart';
import 'package:graduate_project/core/resource/color_manager.dart';
import 'package:graduate_project/core/resource/distance_manager.dart';
import 'package:graduate_project/core/resource/padding_manager.dart';
import 'package:graduate_project/core/resource/string_manager.dart';
import 'package:graduate_project/core/resource/text_style_manager.dart';

Future<dynamic> customConfirmBootomNavigationSheet({
  required BuildContext context,
  required void Function()? onTapYes,
  required void Function()? onTapCancel,
}) {
  Widget container({
    required Color background,
    required Color textColor,
    required String text,
    required void Function()? onTap,
  }) =>
      InkWell(
        onTap: onTap,
        child: Container(
          height: HeightManager.h37,
          decoration: BoxDecoration(
            color: background,
            border: Border.all(
              color: ColorManager.primaryColor,
            ),
            borderRadius: BorderRadius.circular(RaduisValueManager.r8),
          ),
          child: Center(
            child: Text(
              text,
              style: TextStyleManager.bold14(
                color: textColor,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      );
  return showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    builder: (context) {
      return Wrap(
        //  crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Column(
            children: [
              SizedBox(
                height: HeightManager.h6,
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                  width: WidthManager.w70,
                  height: HeightManager.h6,
                  decoration: BoxDecoration(
                    color: ColorManager.gray4,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: PaddingManager.paddingHorizontal16,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: HeightManager.h13,
                ),
                Text(
                  StringManager.logout,
                  style: TextStyleManager.medium20(
                    color: ColorManager.primaryColor,
                  ),
                ),
                Text(
                  StringManager.areYouSurelogout,
                  style: TextStyleManager.medium14(
                    color: ColorManager.blackwithOpacity70,
                  ),
                ),
              ],
            ),
          ),
          Column(
            children: [
              SizedBox(
                height: HeightManager.h13,
              ),
              Padding(
                padding: PaddingManager.paddingHorizontal16,
                child: Row(
                  spacing: WidthManager.w6,
                  children: [
                    Expanded(
                      child: container(
                        background: ColorManager.primaryColor,
                        textColor: ColorManager.whight,
                        text: StringManager.yesLogout,
                        onTap: onTapYes,
                      ),
                    ),
                    Expanded(
                      child: container(
                        background: ColorManager.whight,
                        textColor: ColorManager.primaryColor,
                        text: StringManager.cancel,
                        onTap: onTapCancel,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: HeightManager.h13,
              ),
            ],
          ),
        ],
      );
    },
  );
}
