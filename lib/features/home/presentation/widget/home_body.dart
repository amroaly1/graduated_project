import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graduate_project/core/resource/color_manager.dart';
import 'package:graduate_project/core/resource/distance_manager.dart';
import 'package:graduate_project/core/resource/icon_manager.dart';
import 'package:graduate_project/core/resource/padding_manager.dart';
import 'package:graduate_project/core/resource/string_manager.dart';
import 'package:graduate_project/core/resource/text_style_manager.dart';
import 'package:graduate_project/core/route/navigation_manager.dart';
import 'package:graduate_project/core/route/screen_manager.dart';
import 'package:graduate_project/core/widget/app_bar_of_home_pages.dart';
import 'package:graduate_project/core/widget/default_button.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AppBarOfHomePages(title: StringManager.handTalkApp),
          SizedBox(
            height: HeightManager.h10,
          ),
          Padding(
            padding: PaddingManager.paddingHorizontal24,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    left: WidthManager.w46,
                  ),
                  child: Text(
                    StringManager.forSignLanguage,
                    style: TextStyleManager.medium20(
                      color: ColorManager.primaryColor,
                    ),
                    textAlign: TextAlign.start,
                  ),
                ),
                SizedBox(
                  height: HeightManager.h52,
                ),
                SizedBox(
                  height: HeightManager.h200,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(RaduisValueManager.r10),
                            color: ColorManager.gray5,
                          ),
                          // padding: EdgeInsets.symmetric(
                          //   horizontal: WidthManager.w19,
                          //   vertical: HeightManager.h20,
                          // ),
                          child: Column(
                            children: [
                              SvgPicture.asset(IconManager.uploadvideo),
                              Text(
                                "Upload Video",
                                style: TextStyleManager.medium20(
                                  color: ColorManager.primaryColor,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: WidthManager.w19,
                      ),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(RaduisValueManager.r10),
                            color: ColorManager.gray5,
                          ),
                          // padding: EdgeInsets.symmetric(
                          //   horizontal: WidthManager.w19,
                          //   vertical: HeightManager.h19,
                          // ),
                          child: Column(
                            children: [
                              SvgPicture.asset(IconManager.livechat),
                              Text(
                                "Live Camera",
                                style: TextStyleManager.medium20(
                                  color: ColorManager.primaryColor,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: HeightManager.h20,
                ),
                SizedBox(
                  height: HeightManager.h200,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(RaduisValueManager.r10),
                            color: ColorManager.gray5,
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal: WidthManager.w19,
                            // vertical: HeightManager.h20,
                          ),
                          child: Column(
                            children: [
                              SvgPicture.asset(IconManager.dictionary),
                              Text(
                                "Dictionary",
                                style: TextStyleManager.medium20(
                                  // size: MediaQuery.sizeOf(context).width *
                                  //     (20 / 390),
                                  color: ColorManager.primaryColor,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: WidthManager.w19,
                      ),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(RaduisValueManager.r10),
                            color: ColorManager.gray5,
                          ),
                          // padding: EdgeInsets.symmetric(
                          //   horizontal: WidthManager.w19,
                          //   vertical: HeightManager.h19,
                          // ),
                          child: Column(
                            children: [
                              SvgPicture.asset(
                                IconManager.chat,
                                height: HeightManager.h160,
                                // width: WidthManager.w200,
                                fit: BoxFit.scaleDown,
                              ),
                              Text(
                                "Chat",
                                style: TextStyleManager.medium20(
                                  color: ColorManager.primaryColor,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: HeightManager.h52,
          ),
          DefaultButton(
            text: StringManager.goToChat,
            onPressed: () {
              NavigationManager.push(
                  context: context, screen: ScreenManager.chatView);
            },
          ),
          SizedBox(
            height: HeightManager.h100,
          ),
        ],
      ),
    );
  }
}
