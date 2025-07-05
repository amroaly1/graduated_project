import 'package:flutter/material.dart';
import 'package:graduate_project/core/resource/color_manager.dart';
import 'package:graduate_project/core/resource/distance_manager.dart';
import 'package:graduate_project/core/resource/padding_manager.dart';
import 'package:graduate_project/core/resource/string_manager.dart';
import 'package:graduate_project/core/resource/text_style_manager.dart';
import 'package:graduate_project/core/route/navigation_manager.dart';
import 'package:graduate_project/core/route/screen_manager.dart';
import 'package:graduate_project/core/widget/cutsom_app_bar_of_sub_page.dart';
import 'package:graduate_project/core/widget/default_button.dart';
import 'package:graduate_project/features/upload/presentation/widget/model_bottom_sheet_card.dart';
import 'package:graduate_project/features/upload/presentation/widget/video_that_translate.dart';

class TranslateVideoBody extends StatelessWidget {
  const TranslateVideoBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CutsomAppBarOfSubPage(),
          SizedBox(height: HeightManager.h29),
          Padding(
            padding: PaddingManager.paddingHorizontal24,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  StringManager.uploadvideo,
                  style: TextStyleManager.bold24(),
                ),
                SizedBox(
                  height: HeightManager.h29,
                ),
                VideoThatTranslate(),
              ],
            ),
          ),
          SizedBox(height: HeightManager.h40),
          DefaultButton(
            text: StringManager.translate,
            onPressed: () {
              modelBottomSheetTranslateVideo(
                context: context,
                onTaptranslatetoText: () {
                  NavigationManager.pop(context: context);
                  NavigationManager.pushReplace(
                    context: context,
                    screen: ScreenManager.translateToTextView,
                  );
                },
                onTaptranslatetoAudio: () {
                  NavigationManager.pop(context: context);
                  NavigationManager.pushReplace(
                    context: context,
                    screen: ScreenManager.translateToAudioView,
                  );
                },
              );
            },
          ),
          SizedBox(height: HeightManager.h10),
          DefaultButton(
            text: StringManager.cancel,
            onPressed: () {
              NavigationManager.pop(context: context);
            },
          ),
        ],
      ),
    );
  }

  Future<dynamic> modelBottomSheetTranslateVideo({
    required BuildContext context,
    required void Function()? onTaptranslatetoText,
    required void Function()? onTaptranslatetoAudio,
  }) {
    return showModalBottomSheet(
        context: context,
        isScrollControlled: false,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(RaduisValueManager.r30),
            topRight: Radius.circular(RaduisValueManager.r30),
          ),
        ),
        builder: (context) {
          return Wrap(
            children: [
              Column(
                children: [
                  Column(
                    children: [
                      SizedBox(
                        height: HeightManager.h6,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          width: WidthManager.w70,
                          height: HeightManager.h6,
                          decoration: BoxDecoration(
                            color: ColorManager.gray4,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: PaddingManager.paddingHorizontal24,
                    child: Column(
                      spacing: HeightManager.h15,
                      children: [
                        SizedBox(
                          height: HeightManager.h16,
                        ),
                        ModelBottomSheetCard(
                          title: StringManager.translatetoText,
                          onTap: onTaptranslatetoText,
                        ),
                        ModelBottomSheetCard(
                          title: StringManager.translatetoAudio,
                          onTap: onTaptranslatetoAudio,
                        ),
                        SizedBox(
                          height: HeightManager.h20,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          );
        });
  }
}
