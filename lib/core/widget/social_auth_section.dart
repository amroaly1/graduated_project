import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graduate_project/core/resource/color_manager.dart';
import 'package:graduate_project/core/resource/distance_manager.dart';
import 'package:graduate_project/core/resource/icon_manager.dart';
import 'package:graduate_project/core/resource/padding_manager.dart';
import 'package:graduate_project/core/resource/text_style_manager.dart';

class SocialAuthSection extends StatelessWidget {
  const SocialAuthSection(
      {super.key,
      this.onTapFaceBook,
      this.onTapGoogle,
      this.onTapApple,
      required this.title});
  final void Function()? onTapFaceBook;
  final void Function()? onTapGoogle;
  final void Function()? onTapApple;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: PaddingManager.paddingHorizontal24,
      child: Column(
        children: [
          Row(
            spacing: WidthManager.w12,
            children: [
              Expanded(
                child: Divider(
                  color: ColorManager.gray,
                ),
              ),
              Text(
                title,
                style: TextStyleManager.bold14(
                    color: ColorManager.blackwithOpacity70),
              ),
              Expanded(
                child: Divider(
                  color: ColorManager.gray,
                ),
              ),
            ],
          ),
          SizedBox(height: HeightManager.h24),
          Row(
            spacing: WidthManager.w16,
            children: [
              _customcardofsocial(
                icon: IconManager.facebook,
                onTap: onTapFaceBook,
              ),
              _customcardofsocial(
                icon: IconManager.google,
                onTap: onTapGoogle,
              ),
              _customcardofsocial(
                icon: IconManager.apple,
                onTap: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _customcardofsocial(
      {required String icon, required void Function()? onTap}) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(
            vertical: HeightManager.h19,
          ),
          decoration: BoxDecoration(
            color: ColorManager.whight,
            borderRadius: BorderRadius.circular(
              RaduisValueManager.r10,
            ),
            border: Border.all(color: ColorManager.gray),
          ),
          child: SvgPicture.asset(
            icon,
            fit: BoxFit.scaleDown,
          ),
        ),
      ),
    );
  }
}
