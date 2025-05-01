import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graduate_project/core/resource/color_manager.dart';
import 'package:graduate_project/core/resource/device_height_width_manager.dart';
import 'package:graduate_project/core/resource/distance_manager.dart';
import 'package:graduate_project/core/resource/font_family_manger.dart';
import 'package:graduate_project/core/resource/icon_manager.dart';
import 'package:graduate_project/core/resource/image_manager.dart';
import 'package:graduate_project/core/resource/string_manager.dart';
import 'package:graduate_project/core/resource/text_style_manager.dart';

class ChatBody extends StatelessWidget {
  const ChatBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SafeArea(
          child: Container(
            color: ColorManager.whight2,
            width: double.infinity,
            padding: EdgeInsets.symmetric(
              horizontal: WidthManager.w16,
              vertical: HeightManager.h20,
            ),
            alignment: Alignment.center,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "English",
                    style: TextStyleManager.medium20(
                      fontFamily: FontFamilyManger.hvDTrialBrandonGrotesque,
                      color: ColorManager.black,
                    ),
                  ),
                  SvgPicture.asset(
                    IconManager.arrowrightarrowleft,
                  ),
                  Image.asset(ImageManager.american),
                  Text(
                    "American",
                    style: TextStyleManager.medium20(
                      fontFamily: FontFamilyManger.hvDTrialBrandonGrotesque,
                      color: ColorManager.black,
                    ),
                  ),
                  SvgPicture.asset(
                    IconManager.starIcon,
                    width: WidthManager.w46,
                    height: HeightManager.h44,
                  ),
                ],
              ),
            ),
          ),
        ),
        Expanded(child: Container()),
        Container(
          color: ColorManager.whight2,
          padding: EdgeInsets.symmetric(
            horizontal: WidthManager.w16,
            vertical: HeightManager.h19,
          ),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.mic_none_outlined,
                  size: HeightManager.h38,
                  color: ColorManager.blue2,
                ),
                SizedBox(width: WidthManager.w10),
                SizedBox(
                  height: DeviceHeightWidthManager.subOfHeight(
                    context,
                    HeightOfDesign.h60,
                  ),
                  width: (DeviceHeightWidthManager.deviceWidth(context) / 1.5),
                  child: TextField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: WidthManager.w21,
                      ),
                      filled: true,
                      fillColor: ColorManager.whight,
                      border: oulineborder(),
                      hintText: StringManager.enterText,
                      hintStyle: TextStyleManager.medium20(),
                      enabledBorder: oulineborder(),
                      focusedBorder: oulineborder(),
                    ),
                  ),
                ),
                SizedBox(width: WidthManager.w10),
                SvgPicture.asset(IconManager.send),
              ],
            ),
          ),
        ),
      ],
    );
  }

  OutlineInputBorder oulineborder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(
        RaduisValueManager.r30,
      ),
      borderSide: BorderSide(
        color: ColorManager.whight,
      ),
    );
  }
}
