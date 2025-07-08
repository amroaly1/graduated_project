import 'dart:io';

import 'package:flutter/material.dart';
import 'package:graduate_project/core/helper/get_video_thumbnail.dart';
import 'package:graduate_project/core/resource/color_manager.dart';
import 'package:graduate_project/core/resource/distance_manager.dart';
import 'package:graduate_project/core/resource/text_style_manager.dart';
import 'package:graduate_project/features/saving/data/model/video_to_audio_save_model.dart';
import 'package:graduate_project/features/saving/presentation/video_to_audio_detials.dart';
import 'package:intl/intl.dart';
import 'package:redacted/redacted.dart';

class CustomCardOfVideoToAudio extends StatelessWidget {
  const CustomCardOfVideoToAudio({
    super.key,
    required this.item,
    this.isSaving = true,
  });
  final TranslationsAudio item;
  final bool isSaving;
  @override
  Widget build(BuildContext context) {
    return Container(
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
        leading: FutureBuilder<File?>(
          future: getVideoThumbnail(item.videoUrl),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              // ignore: sized_box_for_whitespace
              return Container(
                width: WidthManager.w70,
                height: HeightManager.h130,
              ).redacted(
                context: context,
                redact: true,
                configuration: RedactedConfiguration(
                  animationDuration:
                      const Duration(milliseconds: 800), //default
                ),
              );
            } else if (snapshot.hasData) {
              return Image.file(
                snapshot.data!,
                width: WidthManager.w70,
                height: HeightManager.h130,
              );
            } else {
              return Text("Failed to generate thumbnail");
            }
          },
        ),
        title: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => VideoToAudioDetails(
                  item: item,
                ),
              ),
            );
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item.filename,
                style: TextStyleManager.medium14(
                  color: ColorManager.black,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
              SizedBox(
                height: HeightManager.h6,
              ),
              Text(
                "${DateFormat('MMMM d, y').format(DateTime.parse(item.timestamp))} - ${DateFormat('h:mm a').format(DateTime.parse(item.timestamp))} ",
                style: TextStyleManager.regular10(
                  color: ColorManager.gray11,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
