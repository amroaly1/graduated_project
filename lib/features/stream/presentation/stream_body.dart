import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graduate_project/core/resource/color_manager.dart';
import 'package:graduate_project/core/resource/distance_manager.dart';
import 'package:graduate_project/core/resource/icon_manager.dart';
import 'package:graduate_project/core/resource/padding_manager.dart';
import 'package:graduate_project/core/resource/string_manager.dart';
import 'package:graduate_project/core/resource/text_style_manager.dart';
import 'package:graduate_project/core/widget/cutsom_app_bar_of_sub_page.dart';
import 'package:graduate_project/features/stream/presentation/widget/custom_navigation_card.dart';

class StreamBody extends StatelessWidget {
  const StreamBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          CutsomAppBarOfSubPage(
            showArrow: false,
            isSpacingBeforeLogo: false,
          ),
          Padding(
            padding: PaddingManager.paddingHorizontal24,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  StringManager.liveTranslation,
                  textAlign: TextAlign.start,
                  style: TextStyleManager.black40(),
                ),
                SizedBox(height: HeightManager.h20),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: WidthManager.w21,
                  ),
                  child: Text(
                    StringManager.liveTranslationDescription,
                    textAlign: TextAlign.start,
                    style: TextStyleManager.semiBold16(),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(
                    bottom: HeightManager.h15,
                    right: WidthManager.w10,
                    left: WidthManager.w10,
                  ),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: ColorManager.whight,
                    border: Border.all(
                      color: ColorManager.primaryColor,
                      width: 2,
                    ),
                  ),
                  child: SvgPicture.asset(
                    IconManager.streamPageCamera,
                  ),
                ),
                SizedBox(
                  height: HeightManager.h26,
                ),
                Text(
                  StringManager.clickhertotranslate,
                  style: TextStyleManager.bold20(),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: HeightManager.h26),
                CustomNavigationCard(
                  title: StringManager.videotoAudio,
                  icon: Icons.play_circle,
                  onTap: () {
                    // go to screen video to audio
                  },
                ),
                SizedBox(
                  height: HeightManager.h20,
                ),
                CustomNavigationCard(
                  title: StringManager.videotoText,
                  icon: Icons.article_outlined,
                  onTap: () {
                    // go to screen video to text
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
