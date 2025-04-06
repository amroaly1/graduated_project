import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graduate_project/core/resource/color_manager.dart';
import 'package:graduate_project/core/resource/distance_manager.dart';
import 'package:graduate_project/core/resource/icon_manager.dart';
import 'package:graduate_project/core/resource/padding_manager.dart';
import 'package:graduate_project/core/route/navigation_manager.dart';

class CutsomAppBarOfSubPage extends StatelessWidget {
  const CutsomAppBarOfSubPage(
      {super.key,
      this.showLogo = true,
      this.showArrow = true,
      this.isSpacingBeforeLogo = true});
  final bool showLogo;
  final bool showArrow;
  final bool isSpacingBeforeLogo;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: PaddingManager.paddingHorizontal24,
      child: Column(
        children: [
          SizedBox(height: HeightManager.h29),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              showArrow
                  ? InkWell(
                      onTap: () {
                        NavigationManager.pop(context: context);
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: WidthManager.w16,
                          vertical: HeightManager.h11,
                        ),
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(RaduisValueManager.r10),
                          color: ColorManager.primaryColor,
                          border: Border.all(color: ColorManager.gray),
                        ),
                        child: SvgPicture.asset(
                          IconManager.arrowLeft,
                          width: WidthManager.w9_28,
                          height: HeightManager.h13_78,
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                    )
                  : SizedBox(),
              showLogo
                  ? Padding(
                      padding: EdgeInsets.only(
                        right: isSpacingBeforeLogo ? WidthManager.w48 : 0,
                      ),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: SvgPicture.asset(
                          IconManager.starIcon,
                          width: WidthManager.w46,
                          height: HeightManager.h44,
                        ),
                      ),
                    )
                  : SizedBox(),
            ],
          ),
        ],
      ),
    );
  }
}
