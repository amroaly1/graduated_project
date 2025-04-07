import 'package:flutter/material.dart';
import 'package:graduate_project/core/resource/color_manager.dart';
import 'package:graduate_project/core/resource/device_height_width_manager.dart';
import 'package:graduate_project/core/resource/distance_manager.dart';
import 'package:graduate_project/core/resource/string_manager.dart';
import 'package:graduate_project/core/resource/text_style_manager.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.onChanged,
    required this.controller,
  });
  final void Function(String)? onChanged;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: DeviceHeightWidthManager.subOfHeight(
        context,
        HeightOfDesign.h51,
      ),
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        style: TextStyleManager.light16(color: ColorManager.black),
        cursorHeight: HeightManager.h18,
        cursorColor: ColorManager.blue,
        cursorWidth: 1,
        textAlign: TextAlign.left,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.zero,
          filled: true,
          fillColor: ColorManager.light3purpleColor,
          prefixIcon: Icon(
            Icons.search,
            color: ColorManager.whight,
            size: HeightManager.h22,
          ),
          hintText: StringManager.searchforWords,
          hintStyle: TextStyleManager.light16(),
          border: outlineinputboarder(),
          focusedBorder: outlineinputboarder(),
          enabledBorder: outlineinputboarder(),
          disabledBorder: outlineinputboarder(),
          focusedErrorBorder: outlineinputboarder(),
          errorBorder: outlineinputboarder(),
        ),
      ),
    );
  }

  OutlineInputBorder outlineinputboarder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(
        RaduisValueManager.r20,
      ),
      borderSide: BorderSide(
        color: ColorManager.light3purpleColor,
      ),
    );
  }
}
