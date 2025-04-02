import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graduate_project/core/resource/color_manager.dart';
import 'package:graduate_project/core/resource/distance_manager.dart';

class BackgroundOfArrow extends StatelessWidget {
  const BackgroundOfArrow({
    super.key,
    required this.pathArrow,
    this.onTap,
  });
  final String pathArrow;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: HeightManager.h29,
        height: WidthManager.w29,
        decoration: BoxDecoration(
          color: ColorManager.primaryColor,
          shape: BoxShape.circle,
        ),
        child: Center(
          child: SvgPicture.asset(
            pathArrow,
            width: WidthManager.w9_28,
            height: HeightManager.h13_78,
          ),
        ),
      ),
    );
  }
}
