import 'package:flutter/material.dart';
import 'package:graduate_project/core/resource/color_manager.dart';
import 'package:graduate_project/core/resource/device_height_width_manager.dart';
import 'package:graduate_project/core/resource/distance_manager.dart';
import 'package:graduate_project/core/resource/padding_manager.dart';
import 'package:graduate_project/core/resource/string_manager.dart';
import 'package:graduate_project/core/resource/text_style_manager.dart';
import 'package:graduate_project/core/widget/cutsom_app_bar_of_sub_page.dart';
import 'package:graduate_project/features/saving/data/model/video_to_text_save_model.dart';
import 'package:graduate_project/features/saving/presentation/widget/show_video.dart';

class VideoToTextDetails extends StatelessWidget {
  const VideoToTextDetails({super.key, required this.item});
  final TranslationsText item;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CutsomAppBarOfSubPage(),
            SizedBox(height: HeightManager.h29),
            Padding(
              padding: PaddingManager.paddingHorizontal16,
              child: Column(
                children: [
                  // Container(
                  //   width: double.infinity,
                  //   // height: HeightManager.h319,
                  //   height: DeviceHeightWidthManager.subOfHeight(
                  //     context,
                  //     HeightOfDesign.h319,
                  //   ),
                  //   decoration: BoxDecoration(
                  //     borderRadius: BorderRadius.circular(RaduisValueManager.r10),
                  //   ),
                  //   clipBehavior: Clip.antiAlias,
                  //   child: Image.network(
                  //     item.thumbnailUrl,
                  //   ),
                  // ),
                  ShowVideo(url: item.videoUrl),
                  SizedBox(height: HeightManager.h15),
                  Padding(
                    padding: EdgeInsets.only(left: WidthManager.w12),
                    child: Column(
                      children: [
                        Row(
                          spacing: WidthManager.w6,
                          children: [
                            Text(
                              StringManager.filename,
                              style: TextStyleManager.bold14(),
                            ),
                            Expanded(
                              child: Text(
                                item.filename,
                                style: TextStyleManager.light13(),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: HeightManager.h20,
            ),
            BodySectionOfTranaslateToText(
              data: item,
            ),
          ],
        ),
      ),
    );
  }
}

class BodySectionOfTranaslateToText extends StatelessWidget {
  const BodySectionOfTranaslateToText({
    super.key,
    required this.data,
  });
  final TranslationsText data;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: PaddingManager.paddingHorizontal16,
      child: Container(
        height: DeviceHeightWidthManager.subOfHeight(
          context,
          HeightOfDesign.h240,
        ),
        width: double.infinity,
        decoration: BoxDecoration(
          color: ColorManager.whight4,
          borderRadius: BorderRadius.circular(
            RaduisValueManager.r15,
          ),
          border: Border.all(
            color: ColorManager.primaryColor,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: WidthManager.w13),
          child: Column(
            children: [
              SizedBox(
                height: HeightManager.h18,
              ),
              TitleOfBoxOfVideoToText(),
              SizedBox(
                height: HeightManager.h15,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: WidthManager.w20,
                    ),
                    child: Text(
                      data.text,
                      style: TextStyleManager.light16(
                        color: ColorManager.black,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: HeightManager.h10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TitleOfBoxOfVideoToText extends StatelessWidget {
  const TitleOfBoxOfVideoToText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "English",
          style: TextStyleManager.semiBold17(),
        ),
      ],
    );
  }
}
