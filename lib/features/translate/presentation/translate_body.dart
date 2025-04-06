import 'package:flutter/material.dart';
import 'package:graduate_project/core/resource/device_height_width_manager.dart';
import 'package:graduate_project/core/resource/distance_manager.dart';
import 'package:graduate_project/core/resource/image_manager.dart';
import 'package:graduate_project/core/resource/padding_manager.dart';
import 'package:graduate_project/core/resource/string_manager.dart';
import 'package:graduate_project/core/resource/text_style_manager.dart';
import 'package:graduate_project/core/widget/app_bar_of_home_pages.dart';
import 'package:graduate_project/core/widget/default_button.dart';

class TranslateBody extends StatelessWidget {
  const TranslateBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        AppBarOfHomePages(title: StringManager.translate),
        Padding(
          padding: PaddingManager.paddingHorizontal24,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: HeightManager.h40),
              Image.asset(
                ImageManager.translateImage,
                width: DeviceHeightWidthManager.subOfWidth(
                    context, WidthOfDesign.w364),
                height: DeviceHeightWidthManager.subOfHeight(
                  context,
                  HeightOfDesign.h294,
                ),
              ),
              SizedBox(height: HeightManager.h12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    StringManager.filename,
                    style: TextStyleManager.light13(),
                  ),
                  Text(
                    StringManager.deuration,
                    style: TextStyleManager.light13(),
                  ),
                ],
              ),
            ],
          ),
        ),
        Spacer(
          flex: 4,
        ),
        DefaultButton(
          text: StringManager.translate,
          onPressed: () {},
        ),
        SizedBox(height: HeightManager.h20),
        DefaultButton(
          text: StringManager.cancel,
          onPressed: () {},
        ),
        Spacer(
          flex: 2,
        ),
      ],
    );
  }
}
