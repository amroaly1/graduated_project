import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graduate_project/core/resource/color_manager.dart';
import 'package:graduate_project/core/resource/distance_manager.dart';
import 'package:graduate_project/core/resource/font_family_manger.dart';
import 'package:graduate_project/core/resource/icon_manager.dart';
import 'package:graduate_project/core/resource/text_style_manager.dart';

class CustomNavigationCard extends StatelessWidget {
  const CustomNavigationCard({
    super.key,
    required this.icon,
    required this.title,
    this.onTap,
  });
  final IconData icon;
  final String title;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: HeightManager.h6,
          horizontal: WidthManager.w10,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            RaduisValueManager.r10,
          ),
          color: ColorManager.whight2,
        ),
        child: ListTile(
          leading: Container(
            padding: EdgeInsets.all(HeightManager.h6),
            decoration: BoxDecoration(
                color: ColorManager.whight,
                borderRadius: BorderRadius.circular(RaduisValueManager.r10)),
            child: Icon(
              icon,
              color: ColorManager.black,
              size: HeightManager.h32,
            ),
          ),
          title: Text(
            title,
            style: TextStyleManager.bold20(
              fontFamily: FontFamilyManger.hvDTrialBrandonGrotesque,
            ),
          ),
          trailing: SvgPicture.asset(
            IconManager.arrowRight,
            colorFilter: ColorFilter.mode(
              ColorManager.primaryColor,
              BlendMode.srcIn,
            ),
          ),
        ),
      ),
    );
  }
}
