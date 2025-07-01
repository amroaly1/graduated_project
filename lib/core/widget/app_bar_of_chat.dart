import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graduate_project/core/resource/color_manager.dart';
import 'package:graduate_project/core/resource/distance_manager.dart';
import 'package:graduate_project/core/resource/font_family_manger.dart';
import 'package:graduate_project/core/resource/font_weight_manager.dart';
import 'package:graduate_project/core/resource/icon_manager.dart';
import 'package:graduate_project/core/resource/string_manager.dart';

import '../resource/text_style_manager.dart';

class AppBarOfChat extends StatelessWidget {
  const AppBarOfChat({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: WidthManager.w12,
        vertical: HeightManager.h10,
      ),
      decoration: BoxDecoration(
        color: ColorManager.primaryColorlight,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(onPressed: () {}, icon: SizedBox()),
          Text(
            StringManager.translate,
            style: TextStyleManager.medium20(
              color: ColorManager.gray9,
              fontFamily: FontFamilyManger.avenirLTStd,
              fontWeight: FontWeightManager.semiBold,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              IconManager.notificationicon,
            ),
          )
        ],
      ),
    );
  }
}
