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

class BridgeBodyView extends StatelessWidget {
  const BridgeBodyView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: HeightManager.h40,
            ),
            Padding(
              padding: PaddingManager.paddingHorizontal16,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    StringManager.handTalkBridge,
                    style: TextStyleManager.bold22(),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: HeightManager.h20,
                  ),
                  Stack(
                    children: [
                      SvgPicture.asset(
                        ImageManager.bridgeintro,
                        height: HeightManager.h160,
                        width: double.infinity,
                        fit: BoxFit.fill,
                      ),
                      Positioned(
                        right: WidthManager.w24,
                        bottom: HeightManager.h70,
                        child: Text(
                          "I’m a Bridger User",
                          style: TextStyleManager.bold16(
                            color: ColorManager.primaryColor,
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: HeightManager.h20,
                  ),
                  Text(
                    StringManager.communicatewithSignLanguageUsers,
                    style: TextStyleManager.medium20(
                      color: ColorManager.gray7,
                      fontFamily: FontFamilyManger.avenirLTStd,
                      fontWeight: FontWeightManager.semiBold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: HeightManager.h2,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: WidthManager.w12,
                    ),
                    child: SvgPicture.asset(
                      IconManager.starBridgeIcon,
                      // height: HeightManager.h24,
                      width: WidthManager.w29,
                      alignment: Alignment.centerLeft,
                    ),
                  ),
                  SizedBox(
                    height: HeightManager.h13,
                  ),
                  Text(
                    StringManager.handTalkBridgeDesc1,
                    style: TextStyleManager.semiBold13(
                      color: ColorManager.gray8,
                    ),
                  ),
                  SizedBox(
                    height: HeightManager.h15,
                  ),
                  Text(
                    StringManager.handTalkBridgeDesc2,
                    style: TextStyleManager.semiBold13(
                      color: ColorManager.gray8,
                    ),
                  ),
                  SizedBox(
                    height: HeightManager.h18,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      right: WidthManager.w12,
                    ),
                    child: SvgPicture.asset(
                      IconManager.starBridgeIcon,
                      // height: HeightManager.h24,
                      width: WidthManager.w35,
                      alignment: Alignment.centerRight,
                    ),
                  ),
                  SizedBox(
                    height: HeightManager.h24,
                  ),
                ],
              ),
            ),
            DefaultButton(
              text: StringManager.continuee,
              onPressed: () {
                NavigationManager.push(
                  context: context,
                  screen: ScreenManager.bridgeChatView,
                );
              },
            ),
            SizedBox(
              height: HeightManager.h80,
            ),
          ],
        ),
      ),
    );
  }
}
