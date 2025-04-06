import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graduate_project/core/resource/color_manager.dart';
import 'package:graduate_project/core/resource/distance_manager.dart';
import 'package:graduate_project/core/resource/image_manager.dart';
import 'package:graduate_project/core/resource/padding_manager.dart';
import 'package:graduate_project/core/resource/string_manager.dart';
import 'package:graduate_project/core/resource/text_style_manager.dart';
import 'package:graduate_project/core/widget/app_bar_of_home_pages.dart';
import 'package:graduate_project/core/widget/default_button.dart';

class UploadBody extends StatelessWidget {
  const UploadBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AppBarOfHomePages(title: StringManager.uploadVideo),
          Padding(
            padding: PaddingManager.paddingHorizontal24,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: HeightManager.h20),
                ListTile(
                  contentPadding: const EdgeInsets.all(0),
                  titleAlignment: ListTileTitleAlignment.top,
                  leading: Container(
                    padding: EdgeInsets.symmetric(
                      vertical: HeightManager.h13,
                      horizontal: WidthManager.w6,
                    ),
                    decoration: BoxDecoration(
                      color: ColorManager.primaryColor,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.videocam,
                      color: ColorManager.whight,
                    ),
                  ),
                  title: Text(
                    StringManager.videos,
                    style: TextStyleManager.medium20(),
                  ),
                  subtitle: Text(
                    StringManager.dateofVideo,
                    style: TextStyleManager.light14(),
                  ),
                ),
                SizedBox(height: HeightManager.h34),
                DottedBorder(
                  borderType: BorderType.RRect,
                  radius: Radius.circular(20),
                  dashPattern: [10, 10],
                  color: Colors.grey,
                  strokeWidth: 2,
                  child: Column(
                    children: [
                      SizedBox(height: HeightManager.h32),
                      SvgPicture.asset(
                        ImageManager.uploadvideoimage,
                      ),
                      SizedBox(height: HeightManager.h22),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: WidthManager.w48,
                        ),
                        child: Text(
                          StringManager.selectOrCaptureVideo,
                          style: TextStyleManager.medium24(
                            color: ColorManager.black,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(
                        height: HeightManager.h52,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: HeightManager.h34),
          DefaultButton(
            text: StringManager.selectVideo,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
