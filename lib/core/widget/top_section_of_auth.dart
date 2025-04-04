import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graduate_project/core/resource/distance_manager.dart';
import 'package:graduate_project/core/resource/icon_manager.dart';
import 'package:graduate_project/core/resource/padding_manager.dart';
import 'package:graduate_project/core/resource/text_style_manager.dart';

class TopSectionOfAuth extends StatelessWidget {
  const TopSectionOfAuth({
    super.key,
    required this.text,
  });
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: PaddingManager.paddingHorizontal24,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: EdgeInsets.only(
              right: WidthManager.w48,
              top: HeightManager.h40,
            ),
            child: Align(
              alignment: Alignment.centerRight,
              child: SvgPicture.asset(
                IconManager.starIcon,
              ),
            ),
          ),
          Text(
            text,
            style: TextStyleManager.black36(),
            textAlign: TextAlign.left,
          ),
        ],
      ),
    );
  }
}
