import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graduate_project/core/resource/color_manager.dart';
import 'package:graduate_project/core/resource/device_height_width_manager.dart';
import 'package:graduate_project/core/resource/distance_manager.dart';
import 'package:graduate_project/core/resource/font_family_manger.dart';
import 'package:graduate_project/core/resource/image_manager.dart';
import 'package:graduate_project/core/resource/string_manager.dart';
import 'package:graduate_project/core/resource/text_style_manager.dart';

class CutomBodyNoSearchFound extends StatelessWidget {
  const CutomBodyNoSearchFound({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 2,
            child: SizedBox(),
          ),
          SvgPicture.asset(
            ImageManager.noresult,
            height: DeviceHeightWidthManager.subOfHeight(
              context,
              HeightOfDesign.h294,
            ),
            width: double.infinity,
          ),
          Text(
            StringManager.noresultsfound,
            style: TextStyleManager.bold17(
              color: ColorManager.primaryColor,
              fontFamily: FontFamilyManger.avenirLTStd,
            ),
          ),
          SizedBox(
            height: HeightManager.h5,
          ),
          Text(
            StringManager.tryadifferentsearchterm,
            style: TextStyleManager.light8(
              color: ColorManager.primaryColor,
            ),
          ),
          Expanded(
            flex: 4,
            child: SizedBox(),
          ),
        ],
      ),
    );
  }
}
