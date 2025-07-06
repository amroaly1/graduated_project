import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graduate_project/core/resource/color_manager.dart';
import 'package:graduate_project/core/resource/distance_manager.dart';
import 'package:graduate_project/core/resource/icon_manager.dart';
import 'package:graduate_project/core/resource/text_style_manager.dart';
import 'package:graduate_project/features/saving/data/model/video_to_text_save_model.dart';
import 'package:graduate_project/features/saving/manager/video_to_text_cubit/video_to_text_cubitt.dart';
import 'package:graduate_project/features/saving/presentation/video_to_text_details.dart';
import 'package:intl/intl.dart';

class CustomCardOfVideoToText extends StatelessWidget {
  const CustomCardOfVideoToText({
    super.key,
    required this.item,
  });
  final TranslationsText item;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        bottom: HeightManager.h22,
      ),
      // padding: EdgeInsets.symmetric(
      //   vertical: HeightManager.h15,
      //   horizontal: WidthManager.w13,
      // ),
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
        leading: Image.network(
          item.thumbnailUrl,
          // fit: BoxFit.fill,
          width: WidthManager.w70,
          height: HeightManager.h130,
        ),
        title: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => VideoToTextDetails(
                  item: item,
                ),
              ),
            );
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item.text,
                style: TextStyleManager.medium16(
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
                onTap: () => VideoToTextCubit.get(context)
                    .deleteItem(trsnlationid: item.id),
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
