import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graduate_project/core/resource/color_manager.dart';
import 'package:graduate_project/core/resource/distance_manager.dart';
import 'package:graduate_project/core/resource/icon_manager.dart';
import 'package:graduate_project/core/resource/padding_manager.dart';
import 'package:graduate_project/core/resource/string_manager.dart';
import 'package:graduate_project/core/resource/text_style_manager.dart';

class CustomSearchHomeTextField extends StatelessWidget {
  const CustomSearchHomeTextField({super.key, this.controller, this.onChanged});
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: PaddingManager.paddingHorizontal24,
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        style: TextStyleManager.medium16(
          color: ColorManager.black,
        ),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(
            vertical: HeightManager.h10,
            horizontal: WidthManager.w21,
          ),
          filled: true,
          fillColor: ColorManager.gray12,
          border: outlineinputborder(),
          enabledBorder: outlineinputborder(),
          focusedBorder: outlineinputborder(),
          hintText: StringManager.searchHandTalk,
          hintStyle: TextStyleManager.medium16(),
          prefixIcon: SvgPicture.asset(
            IconManager.searchicon,
            fit: BoxFit.scaleDown,
          ),
        ),
      ),
    );
  }

  OutlineInputBorder outlineinputborder() {
    return OutlineInputBorder(
      borderSide: BorderSide(
        color: ColorManager.gray12,
      ),
      borderRadius: BorderRadius.circular(
        RaduisValueManager.r8,
      ),
    );
  }
}
