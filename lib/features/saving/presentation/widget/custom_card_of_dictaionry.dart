import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graduate_project/core/dependency_injection/di.dart';
import 'package:graduate_project/core/helper/get_video_thumbnail.dart';
import 'package:graduate_project/core/resource/color_manager.dart';
import 'package:graduate_project/core/resource/distance_manager.dart';
import 'package:graduate_project/core/resource/icon_manager.dart';
import 'package:graduate_project/core/resource/text_style_manager.dart';
import 'package:graduate_project/features/saving/data/model/dictionary_saving_model.dart';
import 'package:graduate_project/features/saving/manager/cubit/get_all_data_saving_cubit.dart';
import 'package:graduate_project/features/saving/manager/dictionary_saving_cubit/dictionary_saving_cubit.dart';
import 'package:graduate_project/features/saving/presentation/dictionary_details_saving.dart';
import 'package:intl/intl.dart';
import 'package:redacted/redacted.dart';

class CustomCardOfDictaionry extends StatelessWidget {
  const CustomCardOfDictaionry({super.key, required this.item});
  final DictionarySavingModel item;
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
              MaterialPageRoute(builder: (context) {
                return DictionaryDetailsSaving(
                  word: item,
                ); // Replace with your widget
              }),
            );
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item.gloss,
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
                "${DateFormat('MMMM d, y').format(DateTime.parse(item.favoritedOn))} - ${DateFormat('h:mm a').format(DateTime.parse(item.favoritedOn))} ",
                style: TextStyleManager.regular10(
                  color: ColorManager.gray11,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ],
          ),
        ),
        trailing: Row(
          spacing: WidthManager.w9_28,
          mainAxisSize: MainAxisSize.min,
          children: [
            Material(
              child: InkWell(
                onTap: () {},
                splashColor: Colors.grey.shade400,
                child: SvgPicture.asset(
                  IconManager.shareicon,
                ),
              ),
            ),
            Material(
              child: InkWell(
                borderRadius: BorderRadius.circular(RaduisValueManager.r8),
                onTap: () {
                  DictionarySavingCubit.get(context)
                      .deleteItem(id: item.dictionaryEntryId);
                  di<GetAllDataSavingCubit>().delete();
                },
                splashColor: Colors.grey.shade400,
                child: SvgPicture.asset(
                  IconManager.deleteiconsaving,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
