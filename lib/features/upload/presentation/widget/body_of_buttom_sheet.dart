import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graduate_project/core/resource/color_manager.dart';
import 'package:graduate_project/core/resource/distance_manager.dart';
import 'package:graduate_project/core/resource/icon_manager.dart';
import 'package:graduate_project/core/resource/string_manager.dart';
import 'package:graduate_project/core/resource/text_style_manager.dart';
import 'package:graduate_project/features/upload/manager/upload_cubit/upload_cubit.dart';

class BodyOfBoyyomSheet extends StatelessWidget {
  const BodyOfBoyyomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: HeightManager.h300,
      width: double.infinity,
      decoration: BoxDecoration(
        color: ColorManager.whight,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(RaduisValueManager.r72),
          topRight: Radius.circular(RaduisValueManager.r72),
        ),
      ),
      child: Column(
        children: [
          SizedBox(height: HeightManager.h20),
          Container(
            width: WidthManager.w70,
            height: HeightManager.h7,
            color: ColorManager.gray4,
          ),
          SizedBox(height: HeightManager.h38),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: UploadCubit.get(context).pickVideoFromGalllery,
                icon: Column(
                  spacing: HeightManager.h2,
                  children: [
                    SvgPicture.asset(
                      IconManager.gallery,
                      height: HeightManager.h24,
                    ),
                    Text(
                      StringManager.gallery,
                      style: TextStyleManager.medium14(
                        color: ColorManager.gray17,
                      ),
                    ),
                  ],
                ),
              ),
              IconButton(
                onPressed: UploadCubit.get(context).pickVideoFromCamera,
                icon: Column(
                  spacing: HeightManager.h2,
                  children: [
                    SvgPicture.asset(
                      IconManager.camera,
                      height: HeightManager.h24,
                    ),
                    Text(
                      StringManager.camera,
                      style: TextStyleManager.medium14(
                        color: ColorManager.gray17,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
