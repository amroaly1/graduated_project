import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graduate_project/core/resource/color_manager.dart';
import 'package:graduate_project/core/resource/distance_manager.dart';
import 'package:graduate_project/core/resource/icon_manager.dart';
import 'package:graduate_project/core/resource/text_style_manager.dart';
import 'package:graduate_project/features/saving/data/saving_category_model.dart';

class CustomCardSaving extends StatelessWidget {
  const CustomCardSaving({
    super.key,
    required this.item,
    this.onTapShare,
    this.onTapDelete,
  });
  final SavingCategoryItem item;
  final void Function()? onTapShare;
  final void Function()? onTapDelete;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        bottom: HeightManager.h22,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(RaduisValueManager.r8),
        color: ColorManager.whight,
        boxShadow: [
          BoxShadow(
            color: ColorManager.gray,
            blurRadius: 4,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(
          horizontal: WidthManager.w13,
        ),
        leading: Image.asset(
          item.image,
          fit: BoxFit.fill,
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              item.title,
              style: TextStyleManager.medium20(),
            ),
            Text(
              item.subtitl1,
              style: TextStyleManager.medium13(
                height: 0.5,
              ),
            ),
            Text(
              item.subtitl2,
              style: TextStyleManager.medium13(),
            ),
          ],
        ),
        trailing: Row(
          spacing: WidthManager.w9_28,
          mainAxisSize: MainAxisSize.min,
          children: [
            Material(
              child: InkWell(
                onTap: onTapShare,
                splashColor: Colors.grey.shade400,
                child: SvgPicture.asset(
                  IconManager.shareicon,
                ),
              ),
            ),
            Material(
              child: InkWell(
                borderRadius: BorderRadius.circular(RaduisValueManager.r8),
                onTap: onTapDelete,
                splashColor: Colors.grey.shade400,
                child: SvgPicture.asset(
                  IconManager.deleteiconsaving,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
