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
          CutsomAppBarOfSubPage(
            onTap: () {
              showAlertDialogUploadVideo(context);
            },
          ),
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
                    showAlertDialogUploadVideo(context);
                    // NavigationManager.pop(context: context);
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

  Future<dynamic> showAlertDialogUploadVideo(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        contentPadding: EdgeInsets.symmetric(
          horizontal: WidthManager.w16,
          vertical: HeightManager.h9,
        ),
        actionsPadding: EdgeInsets.only(
          left: WidthManager.w16,
          right: HeightManager.h9,
          bottom: HeightManager.h20,
        ),
        titlePadding: EdgeInsets.only(
          top: HeightManager.h29,
          left: WidthManager.w16,
          right: WidthManager.w16,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            RaduisValueManager.r5,
          ), // 👈 Rounded corners
        ),
        title: Text(
          StringManager.areyousuretoremovethisvideo,
          style: TextStyleManager.bold13(
            color: ColorManager.black,
          ),
        ),
        content: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: ColorManager.primaryColor,
            borderRadius: BorderRadius.circular(
              RaduisValueManager.r5,
            ),
          ),
          padding: EdgeInsets.symmetric(
            horizontal: WidthManager.w10,
            vertical: HeightManager.h10,
          ),
          child: Row(
            children: [
              Icon(
                Icons.warning_rounded,
                color: Colors.white,
                size: HeightManager.h32,
              ),
              SizedBox(
                width: WidthManager.w6,
              ),
              Expanded(
                child: Text(
                  StringManager
                      .thisvideowillbepermanentlydeletedandcannotberecovered,
                  style: TextStyleManager.regular11(
                    color: ColorManager.whight,
                  ),
                  maxLines: 2,
                ),
              ),
            ],
          ),
        ),
        actions: [
          InkWell(
            onTap: () {
              NavigationManager.pop(context: context);
            },
            child: Text(
              StringManager.cancel,
              style: TextStyleManager.regular11(
                color: ColorManager.gray1,
              ),
            ),
          ),
          InkWell(
            onTap: () {
              NavigationManager.pop(context: context);
              NavigationManager.pop(context: context);
            },
            child: Container(
              padding: EdgeInsets.symmetric(
                vertical: HeightManager.h5,
                horizontal: WidthManager.w12,
              ),
              decoration: BoxDecoration(
                color: ColorManager.primaryColor,
                borderRadius: BorderRadius.circular(
                  RaduisValueManager.r8,
                ),
              ),
              child: Text(
                StringManager.yesdelete,
                style: TextStyleManager.regular11(
                  color: ColorManager.whight,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
