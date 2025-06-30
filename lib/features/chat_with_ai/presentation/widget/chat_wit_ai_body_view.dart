import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graduate_project/core/resource/color_manager.dart';
import 'package:graduate_project/core/resource/distance_manager.dart';
import 'package:graduate_project/core/resource/font_family_manger.dart';
import 'package:graduate_project/core/resource/icon_manager.dart';
import 'package:graduate_project/core/resource/image_manager.dart';
import 'package:graduate_project/core/resource/padding_manager.dart';
import 'package:graduate_project/core/resource/string_manager.dart';
import 'package:graduate_project/core/resource/text_style_manager.dart';

class ChatWitAiBodyView extends StatelessWidget {
  const ChatWitAiBodyView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: HeightManager.h55,
                ),
                Text(
                  StringManager.chattingwithHandTalk,
                  style: TextStyleManager.bold20(
                    color: ColorManager.black,
                    fontFamily: FontFamilyManger.hvDTrialBrandonGrotesque,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: HeightManager.h80,
                ),
                SvgPicture.asset(
                  ImageManager.chattingwithai,
                ),
                SizedBox(
                  height: HeightManager.h34,
                ),
                Text(
                  StringManager.chattingwithHandTalkSubTitle,
                  style: TextStyleManager.bold26(
                    color: ColorManager.primaryColor,
                    fontFamily: FontFamilyManger.hvDTrialBrandonGrotesque,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  height: HeightManager.h70,
                ),
                CustomChattingTextField(),
                SizedBox(
                  height: HeightManager.h20,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CustomChattingTextField extends StatelessWidget {
  const CustomChattingTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: PaddingManager.paddingHorizontal24,
      child: TextField(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(
            horizontal: WidthManager.w21,
          ),
          filled: true,
          fillColor: ColorManager.whight,
          border: oulineInputBorder(),
          enabledBorder: oulineInputBorder(),
          focusedBorder: oulineInputBorder(),
          hintText: StringManager.askanything,
          hintStyle: TextStyleManager.light16(
            color: ColorManager.gray1,
          ),
          suffixIcon: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Material(
                color: Colors.transparent,
                child: InkWell(
                  splashColor: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(RaduisValueManager.r30),
                  onTap: () {},
                  child: Container(
                    width: WidthManager.w35,
                    decoration: BoxDecoration(
                      // color: Colors.black,
                      shape: BoxShape.circle,
                    ),
                    child: SvgPicture.asset(
                      IconManager.recordIcon,
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                ),
              ),
              Material(
                color: Colors.transparent,
                child: InkWell(
                  splashColor: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(RaduisValueManager.r30),
                  onTap: () {},
                  child: Container(
                    width: WidthManager.w35,
                    decoration: BoxDecoration(
                      // color: Colors.black,
                      shape: BoxShape.circle,
                    ),
                    child: SvgPicture.asset(
                      IconManager.sendarrowIcon,
                      width: WidthManager.w24,
                      height: HeightManager.h24,
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: WidthManager.w13,
              ),
            ],
          ),
        ),
      ),
    );
  }

  OutlineInputBorder oulineInputBorder() {
    return OutlineInputBorder(
      borderSide: BorderSide(
        color: ColorManager.whight,
      ),
      borderRadius: BorderRadius.circular(
        RaduisValueManager.r30,
      ),
    );
  }
}
