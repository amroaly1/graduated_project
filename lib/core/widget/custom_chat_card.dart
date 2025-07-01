import 'package:flutter/material.dart';
import 'package:graduate_project/core/resource/color_manager.dart';
import 'package:graduate_project/core/resource/distance_manager.dart';
import 'package:graduate_project/core/resource/font_family_manger.dart';
import 'package:graduate_project/core/resource/font_size_manager.dart';
import 'package:graduate_project/core/resource/font_weight_manager.dart';
import 'package:graduate_project/core/resource/text_style_manager.dart';

class CustomChatCard extends StatelessWidget {
  const CustomChatCard({
    super.key,
    required this.fromMe,
    required this.isStart,
    required this.message,
  });

  final bool fromMe;
  final bool isStart;
  final String message;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: isStart
          ? EdgeInsets.only(bottom: HeightManager.h6, top: HeightManager.h20)
          : EdgeInsets.symmetric(vertical: HeightManager.h6),
      child: Column(
        crossAxisAlignment:
            fromMe ? CrossAxisAlignment.start : CrossAxisAlignment.end,
        children: [
          Container(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.7,
            ),
            padding: EdgeInsets.symmetric(
              vertical: HeightManager.h10,
              horizontal: WidthManager.w12,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                RaduisValueManager.r10,
              ),
              color: ColorManager.primaryColorlight1,
            ),
            child: Wrap(
              children: [
                Text(
                  message,
                  style: TextStyleManager.medium20(
                    color: ColorManager.gray7,
                    fontFamily: FontFamilyManger.avenirLTStd,
                    fontWeight: FontWeightManager.semiBold,
                    size: FontSizeManager.s11,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: HeightManager.h6,
          ),
          Text(
            "12:54 PM",
            style: TextStyleManager.medium20(
              color: ColorManager.gray7,
              fontFamily: FontFamilyManger.avenirLTStd,
              fontWeight: FontWeightManager.semiBold,
              size: FontSizeManager.s11,
            ),
          ),
        ],
      ),
    );
  }
}
