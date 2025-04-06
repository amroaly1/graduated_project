import 'package:flutter/material.dart';
import 'package:graduate_project/core/resource/color_manager.dart';
import 'package:graduate_project/core/resource/device_height_width_manager.dart';
import 'package:graduate_project/core/resource/distance_manager.dart';
import 'package:graduate_project/core/resource/padding_manager.dart';
import 'package:graduate_project/core/resource/string_manager.dart';
import 'package:graduate_project/core/resource/text_style_manager.dart';
import 'package:graduate_project/core/widget/app_bar_of_home_pages.dart';

class LearnBody extends StatelessWidget {
  const LearnBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppBarOfHomePages(title: StringManager.learn),
        Padding(
          padding: PaddingManager.paddingHorizontal24,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: HeightManager.h20),
              CustomTextField(),
              SizedBox(height: HeightManager.h40),
              CustomCardCharacterAndWord(
                char: "A",
                word1: "Access",
                word2: "Awareness",
              ),
              CustomCardCharacterAndWord(
                char: "B",
                word1: "Body",
                word2: "Barrier",
              ),
              CustomCardCharacterAndWord(
                char: "C",
                word1: "Connection",
                word2: "Communication",
              ),
              CustomCardCharacterAndWord(
                char: "D",
                word1: "Deaf",
                word2: "Dialogue",
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class CustomCardCharacterAndWord extends StatelessWidget {
  const CustomCardCharacterAndWord({
    super.key,
    required this.char,
    required this.word1,
    required this.word2,
  });
  final String char;
  final String word1;
  final String word2;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          char,
          style: TextStyleManager.medium20(
            color: ColorManager.black1,
          ),
        ),
        CustomDivider(),
        Text(
          word1,
          style: TextStyleManager.light14(),
        ),
        CustomDivider(),
        Text(
          word2,
          style: TextStyleManager.light14(),
        ),
        CustomDivider(),
      ],
    );
  }
}

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: ColorManager.light4purpleColor,
    );
  }
}

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: DeviceHeightWidthManager.subOfHeight(
        context,
        HeightOfDesign.h51,
      ),
      child: TextField(
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
          hintText: StringManager.search,
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
