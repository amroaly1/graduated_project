import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graduate_project/core/resource/color_manager.dart';
import 'package:graduate_project/core/resource/distance_manager.dart';
import 'package:graduate_project/core/resource/text_style_manager.dart';

class CustomProfileCard extends StatelessWidget {
  const CustomProfileCard({
    super.key,
    required this.title,
    required this.icon,
    this.onTap,
  });
  final String title;
  final String icon;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorManager.whight,
        borderRadius: BorderRadius.circular(HeightManager.h6),
      ),
      child: ListTile(
        leading: Container(
          width: HeightManager.h40,
          height: HeightManager.h44,
          decoration: BoxDecoration(
            color: ColorManager.primaryColor,
            shape: BoxShape.circle,
          ),
          child: Align(
            alignment: Alignment.center,
            child: SvgPicture.asset(
              icon,
              fit: BoxFit.scaleDown,
            ),
          ),
        ),
        title: Text(
          title,
          style: TextStyleManager.bold16(
            color: ColorManager.blackwithOpacity70,
          ),
        ),
        trailing: InkWell(
          onTap: onTap,
          child: Icon(
            Icons.arrow_forward_ios,
            color: ColorManager.primaryColorOpacity70,
            size: HeightManager.h20,
          ),
        ),
      ),
    );
  }
}
