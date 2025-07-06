import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:graduate_project/core/resource/distance_manager.dart';
import 'package:graduate_project/core/resource/padding_manager.dart';
import 'package:graduate_project/core/resource/text_style_manager.dart';
import 'package:graduate_project/core/widget/cutsom_app_bar_of_sub_page.dart';
import 'package:graduate_project/features/saving/data/model/translation_saving_model.dart';

class TranslatioDetails extends StatelessWidget {
  const TranslatioDetails({super.key, required this.item});
  final TranslationsTranslate item;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(children: [
        CutsomAppBarOfSubPage(),
        SizedBox(height: HeightManager.h29),
        Padding(
          padding: PaddingManager.paddingHorizontal24,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                item.originalText,
                style: TextStyleManager.medium32(),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: HeightManager.h15,
              ),
              Image.memory(
                base64Decode(item.img!),
              ),
            ],
          ),
        )
      ])),
    );
  }
}
