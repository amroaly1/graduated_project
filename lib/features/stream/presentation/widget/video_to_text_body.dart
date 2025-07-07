import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:graduate_project/core/resource/color_manager.dart';
import 'package:graduate_project/core/resource/distance_manager.dart';
import 'package:graduate_project/core/resource/font_family_manger.dart';
import 'package:graduate_project/core/resource/image_manager.dart';
import 'package:graduate_project/core/resource/padding_manager.dart';
import 'package:graduate_project/core/resource/string_manager.dart';
import 'package:graduate_project/core/resource/text_style_manager.dart';
import 'package:graduate_project/core/widget/cutsom_app_bar_of_sub_page.dart';

class VideoToTextBody extends StatelessWidget {
  const VideoToTextBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          CutsomAppBarOfSubPage(),
          Padding(
            padding: PaddingManager.paddingHorizontal16,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: HeightManager.h26),
                Text(
                  StringManager.videotoText,
                  style: TextStyleManager.bold20(
                    fontFamily: FontFamilyManger.hvDTrialBrandonGrotesque,
                    color: ColorManager.primaryColor,
                  ),
                  textAlign: TextAlign.start,
                ),
                SizedBox(height: HeightManager.h32),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(RaduisValueManager.r20),
                  ),
                  clipBehavior: Clip.antiAlias,
                  height: HeightManager.h335,
                  width: double.infinity,
                  child: Image.asset(
                    ImageManager.translateImage,
                    fit: BoxFit.fill,
                  ),
                ),
                SizedBox(height: HeightManager.h49),
                DottedBorder(
                  borderType: BorderType.RRect,
                  radius: Radius.circular(20),
                  dashPattern: [10, 10],
                  color: Colors.grey,
                  strokeWidth: 2,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: HeightManager.h49,
                        horizontal: WidthManager.w21),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          StringManager.liveTranslation,
                          style: TextStyleManager.medium24(
                            color: ColorManager.black,
                          ),
                        ),
                        SizedBox(height: HeightManager.h12),
                        Padding(
                          padding: EdgeInsets.only(left: WidthManager.w12),
                          child: Text(
                            "The Translation will appear here...",
                            style: TextStyleManager.light14(),
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
    );
  }
}
