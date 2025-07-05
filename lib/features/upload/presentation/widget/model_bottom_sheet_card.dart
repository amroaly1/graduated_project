import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graduate_project/core/resource/color_manager.dart';
import 'package:graduate_project/core/resource/distance_manager.dart';
import 'package:graduate_project/core/resource/icon_manager.dart';
import 'package:graduate_project/core/resource/text_style_manager.dart';

class ModelBottomSheetCard extends StatelessWidget {
  const ModelBottomSheetCard({
    super.key,
    this.onTap,
    required this.title,
  });

  final void Function()? onTap;
  final String title;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: ListTile(
        tileColor: ColorManager.gray18,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            RaduisValueManager.r30,
          ),
        ),
        title: Padding(
          padding: EdgeInsets.only(left: WidthManager.w10),
          child: Text(
            title,
            style: TextStyleManager.black22(),
          ),
        ),
        trailing: Padding(
          padding: EdgeInsets.only(
            right: WidthManager.w12,
          ),
          child: SvgPicture.asset(
            IconManager.arrowrightbold,
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
