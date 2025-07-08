import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graduate_project/core/resource/color_manager.dart';
import 'package:graduate_project/core/resource/distance_manager.dart';
import 'package:graduate_project/core/resource/font_family_manger.dart';
import 'package:graduate_project/core/resource/font_size_manager.dart';
import 'package:graduate_project/core/resource/font_weight_manager.dart';
import 'package:graduate_project/core/resource/icon_manager.dart';
import 'package:graduate_project/core/resource/padding_manager.dart';
import 'package:graduate_project/core/resource/text_style_manager.dart';
import 'package:graduate_project/core/widget/cutsom_app_bar_of_sub_page.dart';
import 'package:graduate_project/features/saving/data/model/translation_saving_model.dart';

class TranslationDetailsView extends StatelessWidget {
  const TranslationDetailsView({super.key, required this.item});
  final TranslationsTranslate item;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(children: [
        CutsomAppBarOfSubPage(),
        SizedBox(height: HeightManager.h29),
        Expanded(
          child: Padding(
            padding: PaddingManager.paddingHorizontal16,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: SizedBox(),
                ),
                Image.memory(
                  base64Decode(item.img!),
                ),
                Expanded(child: SizedBox()),
                // TextField(
                //   style: TextStyleManager.medium32(),
                //   enabled: false,
                //   decoration: InputDecoration(
                //     label: Center(
                //       child: Text(
                //         item.originalText,
                //         style: TextStyleManager.semiBold24(
                //           color: ColorManager.gray13,
                //         ),
                //       ),
                //     ),
                //     contentPadding: EdgeInsets.zero,
                //     filled: true,
                //     fillColor: ColorManager.whight,
                //     border: OutlineInputBorder(
                //       borderRadius:
                //           BorderRadius.circular(RaduisValueManager.r15),
                //       borderSide: BorderSide.none,
                //     ),
                //   ),
                // ),
                SizedBox(
                  height: HeightManager.h32,
                ),
                CustomChatTextFieldSendDisactive(
                  value: item.originalText,
                ),
                SizedBox(
                  height: HeightManager.h10,
                ),
              ],
            ),
          ),
        )
      ])),
    );
  }
}

class CustomChatTextFieldSendDisactive extends StatelessWidget {
  const CustomChatTextFieldSendDisactive({
    super.key,
    required this.value,
  });
  final String value;

  @override
  Widget build(BuildContext context) {
    var outlineInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(RaduisValueManager.r30),
      borderSide: BorderSide.none,
    );
    return Row(
      children: [
        Expanded(
          child: AbsorbPointer(
            // Disables all interactions
            child: TextField(
              style: TextStyleManager.medium20(
                color: ColorManager.black.withAlpha(150), // Gray text
                size: FontSizeManager.s13,
                fontFamily: FontFamilyManger.avenirLTStd,
                fontWeight: FontWeightManager.semiBold,
              ),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(
                  horizontal: WidthManager.w10,
                ),
                filled: true,
                fillColor: ColorManager.whight.withAlpha(150), // Gray fill
                border: outlineInputBorder,
                focusedBorder: outlineInputBorder,
                enabledBorder: outlineInputBorder,
                labelText: value,
                labelStyle: TextStyleManager.medium20(
                  color: ColorManager.gray10,
                  size: FontSizeManager.s13,
                  fontFamily: FontFamilyManger.avenirLTStd,
                  fontWeight: FontWeightManager.semiBold,
                ),
                prefixIcon: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      onPressed: null, // Disabled
                      icon: SvgPicture.asset(
                        IconManager.recordIcon2,
                        colorFilter: ColorFilter.mode(
                          ColorManager.gray10, // Gray icon
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                    Container(
                      height: HeightManager.h29,
                      width: WidthManager.w1_5,
                      color: ColorManager.gray10,
                    ),
                    SizedBox(
                      width: WidthManager.w10,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          width: WidthManager.w4,
        ),
        Material(
          color: Colors.transparent,
          child: InkWell(
            splashColor: Colors.transparent, // No splash effect
            highlightColor: Colors.transparent, // No highlight effect
            onTap: null, // Disabled
            child: Container(
              padding: EdgeInsets.only(
                left: WidthManager.w14,
                right: WidthManager.w10,
                top: HeightManager.h10,
                bottom: HeightManager.h10,
              ),
              decoration: BoxDecoration(
                color: ColorManager.whight.withAlpha(150), // Gray fill
                shape: BoxShape.circle,
              ),
              child: SvgPicture.asset(
                IconManager.sendicon,
                colorFilter: ColorFilter.mode(
                  ColorManager.gray10, // Gray icon
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
