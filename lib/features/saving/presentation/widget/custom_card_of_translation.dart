import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graduate_project/core/dependency_injection/di.dart';
import 'package:graduate_project/core/resource/color_manager.dart';
import 'package:graduate_project/core/resource/distance_manager.dart';
import 'package:graduate_project/core/resource/icon_manager.dart';
import 'package:graduate_project/core/resource/text_style_manager.dart';
import 'package:graduate_project/features/saving/data/model/translation_saving_model.dart';
import 'package:graduate_project/features/saving/manager/cubit/get_all_data_saving_cubit.dart';
import 'package:graduate_project/features/saving/manager/translation_saving/trsanlation_saving_cubit.dart';
import 'package:graduate_project/features/saving/presentation/translatio_details.dart';
import 'package:intl/intl.dart';

class CustomCardOfTranslation extends StatelessWidget {
  const CustomCardOfTranslation({
    super.key,
    required this.item,
    this.isSaving = true,
  });
  final TranslationsTranslate item;
  final bool isSaving;
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
          item.thumbnailUrl!,
          // fit: BoxFit.fill,
          width: WidthManager.w70,
          height: HeightManager.h130,
        ),
        title: InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return TranslatioDetails(
                  item: item,
                );
              },
            ));
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item.originalText,
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
                "${DateFormat('MMMM d, y').format(DateTime.parse(item.savedAt!))} - ${DateFormat('h:mm a').format(DateTime.parse(item.savedAt!))} ",
                style: TextStyleManager.regular10(
                  color: ColorManager.gray11,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ],
          ),
        ),
        trailing: isSaving
            ? Row(
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
                      borderRadius:
                          BorderRadius.circular(RaduisValueManager.r8),
                      onTap: () {
                        TrsanlationSavingCubit.get(context)
                            .deleteItem(trsnlationid: item.translationId);
                        di<GetAllDataSavingCubit>().delete();
                      },
                      splashColor: Colors.grey.shade400,
                      child: SvgPicture.asset(
                        IconManager.deleteiconsaving,
                      ),
                    ),
                  ),
                ],
              )
            : null,
      ),
    );
  }
}
