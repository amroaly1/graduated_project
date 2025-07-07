import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graduate_project/core/resource/color_manager.dart';
import 'package:graduate_project/core/resource/distance_manager.dart';
import 'package:graduate_project/core/resource/font_family_manger.dart';
import 'package:graduate_project/core/resource/icon_manager.dart';
import 'package:graduate_project/core/resource/padding_manager.dart';
import 'package:graduate_project/core/resource/string_manager.dart';
import 'package:graduate_project/core/resource/text_style_manager.dart';
import 'package:graduate_project/core/route/navigation_manager.dart';
import 'package:graduate_project/core/route/screen_manager.dart';
import 'package:graduate_project/features/home/presentation/widget/body_of_card_recentaly_translate.dart';
import 'package:graduate_project/features/home/presentation/widget/body_of_home_of_recentaly_saved.dart';
import 'package:graduate_project/features/home/presentation/widget/recentaly_chat.dart';
import 'package:graduate_project/features/home/presentation/widget/custom_dictionary_home_card.dart';
import 'package:graduate_project/features/home/presentation/widget/custom_home_card.dart';
import 'package:graduate_project/features/home/presentation/widget/custom_home_chating_with_ai.dart';
import 'package:graduate_project/features/home/presentation/widget/custom_name_and_image_home_view.dart';
import 'package:graduate_project/features/home/presentation/widget/custom_search_home_text_field.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: HeightManager.h52,
            ),
            Padding(
              padding: PaddingManager.paddingHorizontal16,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomNameAndImageHomeView(),
                  SvgPicture.asset(
                    IconManager.notificationicon,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: HeightManager.h26,
            ),
            InkWell(
              onTap: () {
                NavigationManager.push(
                  context: context,
                  screen: ScreenManager.searchHomeView,
                );
              },
              child: CustomSearchHomeTextField(
                enabled: false,
              ),
            ),
            Padding(
              padding: PaddingManager.paddingHorizontal16,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: HeightManager.h15,
                  ),
                  // Padding(
                  //   padding: EdgeInsets.only(left: WidthManager.w10),
                  //   child: Text(
                  //     StringManager.whatsYourPlanforToday,
                  //     style: TextStyleManager.semiBold15(),
                  //   ),
                  // ),
                  // SizedBox(
                  //   height: HeightManager.h19,
                  // ),
                  RecentlyChat(),
                  SizedBox(
                    height: HeightManager.h13,
                  ),
                  CustomHomeCard(
                    title: StringManager.recentlyTranslated,
                    button: IconButton(
                      onPressed: () {},
                      icon: SizedBox(),
                      // icon: SvgPicture.asset(
                      //   IconManager.arrowRight,
                      //   colorFilter: ColorFilter.mode(
                      //     ColorManager.primaryColorlight6,
                      //     BlendMode.srcIn,
                      //   ),
                      // ),
                    ),
                    body: BodyOfCardRecentalyTranslate(),
                  ),
                  SizedBox(
                    height: HeightManager.h10,
                  ),
                  CustomHomeCard(
                    title: StringManager.recentlySaved,
                    button: TextButton(
                      onPressed: () {
                        NavigationManager.push(
                          context: context,
                          screen: ScreenManager.savingView,
                        );
                      },
                      child: Text(
                        StringManager.seeAll,
                        style: TextStyleManager.regular10(
                          color: ColorManager.primaryColor,
                          fontFamily: FontFamilyManger.hvDTrialBrandonGrotesque,
                        ),
                      ),
                    ),
                    body: BodyOfHomeRecentalySaved(),
                  ),
                  SizedBox(
                    height: HeightManager.h10,
                  ),
                  CustomHomeChattingWithAI(),
                  SizedBox(
                    height: HeightManager.h10,
                  ),
                  CustomDictionaryHomeCard(),
                  SizedBox(
                    height: HeightManager.h80,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/*

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

 */
