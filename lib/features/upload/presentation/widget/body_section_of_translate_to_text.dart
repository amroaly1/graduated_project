import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graduate_project/core/helper/show_snack_bar.dart';
import 'package:graduate_project/core/resource/color_manager.dart';
import 'package:graduate_project/core/resource/device_height_width_manager.dart';
import 'package:graduate_project/core/resource/distance_manager.dart';
import 'package:graduate_project/core/resource/icon_manager.dart';
import 'package:graduate_project/core/resource/padding_manager.dart';
import 'package:graduate_project/core/resource/text_style_manager.dart';

class BodySectionOfTranaslateToText extends StatelessWidget {
  const BodySectionOfTranaslateToText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: PaddingManager.paddingHorizontal24,
      child: Container(
        height: DeviceHeightWidthManager.subOfHeight(
          context,
          HeightOfDesign.h240,
        ),
        width: double.infinity,
        decoration: BoxDecoration(
          color: ColorManager.whight4,
          borderRadius: BorderRadius.circular(
            RaduisValueManager.r15,
          ),
          border: Border.all(
            color: ColorManager.primaryColor,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: WidthManager.w13),
          child: Column(
            children: [
              SizedBox(
                height: HeightManager.h18,
              ),
              TitleOfBoxOfVideoToText(),
              SizedBox(
                height: HeightManager.h15,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Text(
                    "Type Gujarati is simpler with English to Gujarati Typing software, More the software provides Suggestion while typing in English so you can choose the right wordType Gujarati is simpler with English to Gujarati Typing software, More the software provides Suggestion while typing in Eng provides Suggestion while typing in English so you can choose the ",
                    style: TextStyleManager.light13(
                      color: ColorManager.black,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: HeightManager.h10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TitleOfBoxOfVideoToText extends StatelessWidget {
  const TitleOfBoxOfVideoToText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "English",
          style: TextStyleManager.semiBold17(),
        ),
        Row(
          spacing: WidthManager.w13,
          children: [
            Material(
                color: Colors.transparent,
                child: InkWell(
                  splashColor: Colors.grey.shade400,
                  onTap: () {},
                  child: SvgPicture.asset(
                    height: HeightManager.h15,
                    IconManager.sharegrey,
                  ),
                )),
            Material(
              color: Colors.transparent,
              child: InkWell(
                splashColor: Colors.grey.shade400,
                onTap: () async {
                  // TODO : but text in it
                  await Clipboard.setData(ClipboardData(text: "Hello World! "));

                  showSnackBar(
                    // ignore: use_build_context_synchronously
                    context,
                    message: "Text is Copied",
                  );
                },
                child: SvgPicture.asset(
                  height: HeightManager.h15,
                  IconManager.copygrey,
                ),
              ),
            ),
            Material(
              color: Colors.transparent,
              child: InkWell(
                splashColor: Colors.grey.shade400,
                onTap: () {},
                child: Icon(
                  Icons.bookmark_border_outlined,
                  color: ColorManager.primaryColor,
                  size: HeightManager.h20,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
