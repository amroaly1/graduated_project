import 'package:flutter/material.dart';
import 'package:graduate_project/core/resource/color_manager.dart';
import 'package:graduate_project/core/resource/device_height_width_manager.dart';
import 'package:graduate_project/core/resource/distance_manager.dart';
import 'package:graduate_project/core/resource/font_family_manger.dart';
import 'package:graduate_project/core/resource/font_size_manager.dart';
import 'package:graduate_project/core/resource/image_manager.dart';
import 'package:graduate_project/core/resource/padding_manager.dart';
import 'package:graduate_project/core/resource/string_manager.dart';
import 'package:graduate_project/core/resource/text_style_manager.dart';
import 'package:graduate_project/core/route/navigation_manager.dart';
import 'package:graduate_project/core/route/screen_manager.dart';
import 'package:graduate_project/core/widget/default_button.dart';

class WelcomeBody extends StatelessWidget {
  const WelcomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // SizedBox(height: HeightManager.h55),
          Image.asset(
            ImageManager.welcomeLogo,
            width: DeviceHeightWidthManager.subOfWidth(
              context,
              WidthOfDesign.w299,
            ),
            height: DeviceHeightWidthManager.subOfHeight(
              context,
              HeightOfDesign.h313,
            ),
          ),
          // SizedBox(height: HeightManager.h18),
          // Text(
          //   StringManager.handTalk,
          //   style: TextStyleManager.bold32(
          //     fontFamily: FontFamilyManger.poppins,
          //     color: ColorManager.black,
          //   ),
          //   textAlign: TextAlign.center,
          // ),
          SizedBox(height: HeightManager.h20),
          Text(
            StringManager.welcomeTohandTalk,
            style: TextStyleManager.black32(
              color: ColorManager.black,
              fontSize: FontSizeManager.s28,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: HeightManager.h20),
          Padding(
            padding: PaddingManager.paddingHorizontal16,
            child: Text(
              StringManager.subTitlewelcomeTohandTalk,
              style: TextStyleManager.medium24(
                fontFamily: FontFamilyManger.avenirLTStd,
                color: ColorManager.blackwithOpacity70,
                fontSize: FontSizeManager.s17,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: HeightManager.h38),
          DefaultButton(
            text: StringManager.signIn,
            onPressed: () {
              NavigationManager.push(
                context: context,
                screen: ScreenManager.loginView,
              );
            },
          ),
          SizedBox(height: HeightManager.h13),
          DefaultButton(
            text: StringManager.createAccount,
            onPressed: () {
              NavigationManager.push(
                context: context,
                screen: ScreenManager.siginUpView,
              );
            },
          ),
        ],
      ),
    );
  }
}
