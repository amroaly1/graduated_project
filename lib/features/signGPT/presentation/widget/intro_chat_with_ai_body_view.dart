import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graduate_project/core/resource/color_manager.dart';
import 'package:graduate_project/core/resource/distance_manager.dart';
import 'package:graduate_project/core/resource/font_family_manger.dart';
import 'package:graduate_project/core/resource/font_weight_manager.dart';
import 'package:graduate_project/core/resource/icon_manager.dart';
import 'package:graduate_project/core/resource/image_manager.dart';
import 'package:graduate_project/core/resource/padding_manager.dart';
import 'package:graduate_project/core/resource/string_manager.dart';
import 'package:graduate_project/core/resource/text_style_manager.dart';
import 'package:graduate_project/core/route/navigation_manager.dart';
import 'package:graduate_project/core/route/screen_manager.dart';
import 'package:graduate_project/core/widget/default_button.dart';

class IntroChatWithAiBodyView extends StatelessWidget {
  const IntroChatWithAiBodyView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: HeightManager.h40,
          ),
          Text(
            StringManager.signGPT,
            style: TextStyleManager.bold22(),
            textAlign: TextAlign.center,
          ),
          Text(
            StringManager.handTalkAIAssistant,
            style: TextStyleManager.black14(
              color: ColorManager.primaryColor,
              fontFamily: FontFamilyManger.avenirLTStd,
            ),
            textAlign: TextAlign.center,
          ),
          SvgPicture.asset(
            ImageManager.chatwithai,
            height: HeightManager.h280,
          ),
          Padding(
            padding: PaddingManager.paddingHorizontal16,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  StringManager.signGPTYourAIFluentinSignLanguage,
                  style: TextStyleManager.medium20(
                    color: ColorManager.gray7,
                    fontFamily: FontFamilyManger.avenirLTStd,
                    fontWeight: FontWeightManager.semiBold,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: HeightManager.h10,
                ),
                SvgPicture.asset(
                  IconManager.startquot,
                  alignment: Alignment.centerLeft,
                ),
                Text(
                  StringManager.signGPTDesc,
                  style: TextStyleManager.semiBold13(
                    color: ColorManager.gray8,
                  ),
                  textAlign: TextAlign.center,
                ),
                SvgPicture.asset(
                  IconManager.endquot,
                  alignment: Alignment.centerRight,
                ),
                SizedBox(
                  height: HeightManager.h13,
                ),
              ],
            ),
          ),
          DefaultButton(
            text: StringManager.startChatting,
            onPressed: () {
              NavigationManager.push(
                context: context,
                screen: ScreenManager.chatingWitAiView,
              );
            },
          )
        ],
      ),
    );
  }
}
