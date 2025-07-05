import 'package:flutter/material.dart';
import 'package:graduate_project/core/resource/color_manager.dart';
import 'package:graduate_project/core/resource/distance_manager.dart';
import 'package:graduate_project/core/resource/padding_manager.dart';
import 'package:graduate_project/core/resource/string_manager.dart';
import 'package:graduate_project/core/resource/text_style_manager.dart';
import 'package:graduate_project/core/route/navigation_manager.dart';
import 'package:graduate_project/core/widget/cutsom_app_bar_of_sub_page.dart';
import 'package:graduate_project/features/upload/presentation/widget/video_that_translate.dart';

class GeneralBodyOfTranslateToAudioOrText extends StatelessWidget {
  const GeneralBodyOfTranslateToAudioOrText(
      {super.key, required this.bodySection});
  final Widget bodySection;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          CutsomAppBarOfSubPage(),
          SizedBox(height: HeightManager.h29),
          Padding(
            padding: PaddingManager.paddingHorizontal24,
            child: VideoThatTranslate(),
          ),
          SizedBox(
            height: HeightManager.h20,
          ),
          bodySection,
          SizedBox(
            height: HeightManager.h10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                StringManager.ifyouwanttotranslateanothervideo,
                style: TextStyleManager.semiBold10(
                  color: ColorManager.gray19,
                ),
              ),
              SizedBox(
                width: WidthManager.w6,
              ),
              Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {
                    NavigationManager.pop(context: context);
                  },
                  borderRadius: BorderRadius.circular(
                    RaduisValueManager.r2,
                  ),
                  splashColor: Colors.grey.shade400,
                  child: Text(
                    StringManager.clickhere,
                    style: TextStyleManager.semiBold12(
                      color: ColorManager.primaryColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
