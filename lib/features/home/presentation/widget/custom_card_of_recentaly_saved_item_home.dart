import 'package:flutter/material.dart';

import 'package:graduate_project/core/resource/color_manager.dart';
import 'package:graduate_project/core/resource/distance_manager.dart';
import 'package:graduate_project/core/resource/image_manager.dart';
import 'package:graduate_project/core/resource/text_style_manager.dart';
import 'package:intl/intl.dart';

class CustomCardOfRecentalySavedItemHome extends StatelessWidget {
  const CustomCardOfRecentalySavedItemHome({
    super.key,
    required this.title,
    required this.time,
    required this.image,
  });
  final String title;
  final String time;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: WidthManager.w10,
        right: WidthManager.w16,
        top: HeightManager.h10,
        bottom: HeightManager.h10,
      ),
      margin: EdgeInsets.only(right: WidthManager.w16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(RaduisValueManager.r10),
        color: ColorManager.gray12,
      ),
      child: Row(
        children: [
          Image.network(
            image,
            height: HeightManager.h34,
            width: WidthManager.w35,
            errorBuilder: (context, error, stackTrace) {
              return Image.asset(
                ImageManager.savingimage,
                height: HeightManager.h34,
                width: WidthManager.w35,
              );
            },
          ),
          SizedBox(
            width: WidthManager.w6,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyleManager.bold10(),
              ),
              Text(
                DateFormat('MMMM d, y').format(DateTime.parse(time)),
                style: TextStyleManager.semiBold8(),
              ),
            ],
          )
        ],
      ),
    );
  }
}
