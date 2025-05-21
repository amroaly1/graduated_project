import 'package:flutter/material.dart';
import 'package:graduate_project/core/resource/color_manager.dart';
import 'package:graduate_project/core/resource/distance_manager.dart';
import 'package:graduate_project/core/resource/text_style_manager.dart';
import 'package:redacted/redacted.dart';

class SignDictionaryLoading extends StatelessWidget {
  const SignDictionaryLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        spacing: HeightManager.h10,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: HeightManager.h20,
            ),
            child: Text(
              "Chara",
              style: TextStyleManager.medium20(
                color: ColorManager.black1,
              ),
              textAlign: TextAlign.start,
            ),
          ),
          Column(
            spacing: HeightManager.h10,
            children: List.generate(20, (index) {
              return Container(
                margin: EdgeInsets.symmetric(vertical: HeightManager.h7),
                padding: EdgeInsets.symmetric(
                  // vertical: HeightManager.h10,
                  horizontal: WidthManager.w10,
                ),
                decoration: BoxDecoration(
                  color: ColorManager.whight,
                  borderRadius: BorderRadius.circular(
                    RaduisValueManager.r20,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: SizedBox(
                        child: Text(
                          "word gloss",
                          style: TextStyleManager.light14(),
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.bookmark,
                        color: ColorManager.gray1,
                      ),
                    ),
                  ],
                ),
              );
            }),
          ),
        ],
      ).redacted(
        context: context,
        redact: true,
        configuration: RedactedConfiguration(
          animationDuration: const Duration(milliseconds: 800), //default
        ),
      ),
    );
  }
}
