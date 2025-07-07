import 'package:flutter/material.dart';
import 'package:graduate_project/core/resource/color_manager.dart';
import 'package:graduate_project/core/resource/distance_manager.dart';
import 'package:graduate_project/core/resource/text_style_manager.dart';
import 'package:redacted/redacted.dart';

class CustomLoadingBody extends StatelessWidget {
  const CustomLoadingBody({super.key, this.isSaving = true});

  final bool isSaving;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => CustomCardLaoding(
        isSaving: isSaving,
      ),
      itemCount: 10,
    );
  }
}

class CustomCardLaoding extends StatelessWidget {
  const CustomCardLaoding({
    super.key,
    required this.isSaving,
  });
  final bool isSaving;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: HeightManager.h10,
      ),
      margin: EdgeInsets.only(
        bottom: HeightManager.h22,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(RaduisValueManager.r8),
        color: ColorManager.whight,
        boxShadow: [
          BoxShadow(
            color: ColorManager.gray,
            blurRadius: 4,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(
          horizontal: WidthManager.w13,
        ),
        // ignore: sized_box_for_whitespace
        leading: Container(
          width: WidthManager.w70,
          height: HeightManager.h130,
        ).redacted(
          context: context,
          redact: true,
          configuration: RedactedConfiguration(
            animationDuration: const Duration(milliseconds: 800), //default
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "item.gloss",
              style: TextStyleManager.medium14(
                color: ColorManager.black,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ).redacted(
              context: context,
              redact: true,
              configuration: RedactedConfiguration(
                animationDuration: const Duration(milliseconds: 800), //default
              ),
            ),
            SizedBox(
              height: HeightManager.h6,
            ),
            Text(
              "DateFormat('MMMM d, y')",
              style: TextStyleManager.regular10(
                color: ColorManager.gray11,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ).redacted(
              context: context,
              redact: true,
              configuration: RedactedConfiguration(
                animationDuration: const Duration(milliseconds: 800), //default
              ),
            ),
          ],
        ),
        trailing: isSaving
            ? Row(
                spacing: WidthManager.w9_28,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: WidthManager.w29,
                    height: HeightManager.h32,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                    ),
                  ).redacted(
                    context: context,
                    redact: true,
                    configuration: RedactedConfiguration(
                      animationDuration:
                          const Duration(milliseconds: 800), //default
                    ),
                  ),
                  Container(
                    width: WidthManager.w29,
                    height: HeightManager.h32,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                    ),
                  ).redacted(
                    context: context,
                    redact: true,
                    configuration: RedactedConfiguration(
                      animationDuration:
                          const Duration(milliseconds: 800), //default
                    ),
                  ),
                ],
              )
            : null,
      ),
    );
  }
}
