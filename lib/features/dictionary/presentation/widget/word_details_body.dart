import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graduate_project/core/resource/color_manager.dart';
import 'package:graduate_project/core/resource/distance_manager.dart';
import 'package:graduate_project/core/resource/icon_manager.dart';
import 'package:graduate_project/core/resource/image_manager.dart';
import 'package:graduate_project/core/resource/padding_manager.dart';
import 'package:graduate_project/core/resource/string_manager.dart';
import 'package:graduate_project/core/resource/text_style_manager.dart';
import 'package:graduate_project/core/widget/cutsom_app_bar_of_sub_page.dart';

class WordDetailsBody extends StatelessWidget {
  const WordDetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          CutsomAppBarOfSubPage(),
          Padding(
            padding: PaddingManager.paddingHorizontal24,
            child: Column(
              children: [
                SizedBox(height: HeightManager.h100),
                Image.asset(
                  ImageManager.translateImage,
                ),
                SizedBox(height: HeightManager.h40),
                Container(
                  decoration: BoxDecoration(
                    color: ColorManager.light2purpleColor,
                    borderRadius: BorderRadius.circular(RaduisValueManager.r10),
                  ),
                  padding: EdgeInsets.symmetric(vertical: HeightManager.h15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          SvgPicture.asset(
                            IconManager.share,
                            width: WidthManager.w48,
                            height: HeightManager.h37,
                            colorFilter: ColorFilter.mode(
                                ColorManager.primaryColor, BlendMode.srcIn),
                          ),
                          Text(
                            StringManager.save,
                            style: TextStyleManager.medium20(),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          SvgPicture.asset(
                            IconManager.pausecircle,
                            width: WidthManager.w48,
                            height: HeightManager.h37,
                            colorFilter: ColorFilter.mode(
                                ColorManager.primaryColor, BlendMode.srcIn),
                          ),
                          Text(
                            StringManager.pause,
                            style: TextStyleManager.medium20(),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          SvgPicture.asset(
                            IconManager.save,
                            width: WidthManager.w48,
                            height: HeightManager.h37,
                            colorFilter: ColorFilter.mode(
                                ColorManager.primaryColor, BlendMode.srcIn),
                          ),
                          Text(
                            StringManager.save,
                            style: TextStyleManager.medium20(),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
