import 'package:flutter/material.dart';
import 'package:graduate_project/core/resource/color_manager.dart';
import 'package:graduate_project/core/resource/distance_manager.dart';
import 'package:graduate_project/core/resource/text_style_manager.dart';

class CustomHomeCard extends StatelessWidget {
  const CustomHomeCard({
    super.key,
    required this.body,
    required this.title,
    required this.button,
  });

  final Widget body;
  final String title;
  final Widget button;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(
        left: WidthManager.w16,
        right: WidthManager.w6,
        top: HeightManager.h6,
        bottom: HeightManager.h15,
      ),
      decoration: BoxDecoration(
        color: ColorManager.whight,
        borderRadius: BorderRadius.circular(
          RaduisValueManager.r5,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyleManager.semiBold14(),
              ),
              button,
            ],
          ),
          SizedBox(
            height: HeightManager.h5,
          ),
          body,
        ],
      ),
    );
  }
}
