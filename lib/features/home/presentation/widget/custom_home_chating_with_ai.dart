import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graduate_project/core/resource/color_manager.dart';
import 'package:graduate_project/core/resource/distance_manager.dart';
import 'package:graduate_project/core/resource/icon_manager.dart';
import 'package:graduate_project/core/resource/image_manager.dart';
import 'package:graduate_project/core/resource/string_manager.dart';
import 'package:graduate_project/core/resource/text_style_manager.dart';
import 'package:graduate_project/features/home/manager/home_cubit/cubit/home_cubit.dart';

class CustomHomeChattingWithAI extends StatelessWidget {
  const CustomHomeChattingWithAI({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(
        left: WidthManager.w10,
        right: WidthManager.w6,
        // top: HeightManager.h6,
        bottom: HeightManager.h10,
      ),
      decoration: BoxDecoration(
        color: ColorManager.whight,
        borderRadius: BorderRadius.circular(
          RaduisValueManager.r5,
        ),
      ),
      child: Row(
        children: [
          SvgPicture.asset(
            ImageManager.chatwithai,
            // height: HeightManager.h60,
            width: WidthManager.w60,
            fit: BoxFit.fill,
          ),
          SizedBox(
            width: WidthManager.w10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      StringManager.signGPT,
                      style: TextStyleManager.semiBold14(
                        height: 1,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        HomeCubit.get(context).chnageCurrentIndex(2);
                      },
                      icon: SvgPicture.asset(
                        IconManager.arrowRight,
                        colorFilter: ColorFilter.mode(
                          ColorManager.primaryColorlight6,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                  ],
                ),
                Text(
                  StringManager.howcanIassistyouinsignlanguage,
                  style: TextStyleManager.semiBold10(
                    height: 1,
                    color: ColorManager.gray22,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
