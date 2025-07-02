import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graduate_project/core/resource/color_manager.dart';
import 'package:graduate_project/core/resource/distance_manager.dart';
import 'package:graduate_project/core/resource/font_family_manger.dart';
import 'package:graduate_project/core/resource/icon_manager.dart';
import 'package:graduate_project/core/resource/text_style_manager.dart';

class BodyOfCardRecentalyTranslate extends StatelessWidget {
  const BodyOfCardRecentalyTranslate({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                spacing: WidthManager.w6,
                children: [
                  Container(
                    height: HeightManager.h26,
                    width: HeightManager.h26,
                    decoration: BoxDecoration(
                      color: ColorManager.primaryColorlight7,
                      borderRadius: BorderRadius.circular(
                        RaduisValueManager.r2,
                      ),
                    ),
                    child: SvgPicture.asset(
                      IconManager.texticon,
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                  Text(
                    "help-me.txt",
                    style: TextStyleManager.medium13(
                      color: ColorManager.primaryColorlight3,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: HeightManager.h5,
              ),
              Text(
                "Today",
                style: TextStyleManager.light13(
                  fontFamily: FontFamilyManger.avenirLTStd,
                  color: ColorManager.gray14,
                ),
              )
            ],
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                spacing: WidthManager.w6,
                children: [
                  Container(
                    height: HeightManager.h26,
                    width: HeightManager.h26,
                    decoration: BoxDecoration(
                      color: ColorManager.primaryColorlight7,
                      borderRadius: BorderRadius.circular(
                        RaduisValueManager.r2,
                      ),
                    ),
                    child: SvgPicture.asset(
                      IconManager.voiceicon,
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                  Text(
                    "voiceclip12-47",
                    style: TextStyleManager.medium13(
                      color: ColorManager.primaryColorlight3,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: HeightManager.h5,
              ),
              Text(
                "2d ago",
                style: TextStyleManager.light13(
                  fontFamily: FontFamilyManger.avenirLTStd,
                  color: ColorManager.gray14,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
