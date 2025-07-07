import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduate_project/core/dependency_injection/di.dart';
import 'package:graduate_project/core/resource/color_manager.dart';
import 'package:graduate_project/core/resource/distance_manager.dart';
import 'package:graduate_project/core/resource/font_family_manger.dart';
import 'package:graduate_project/core/resource/text_style_manager.dart';
import 'package:graduate_project/features/home/manager/get_recent_translate/get_recently_translate_cubit.dart';
import 'package:graduate_project/features/home/presentation/widget/body_of_home_of_recentaly_saved.dart';
import 'package:graduate_project/features/home/presentation/widget/custom_card_of_recentaly_saved_item_home.dart';

class BodyOfCardRecentalyTranslate extends StatelessWidget {
  const BodyOfCardRecentalyTranslate({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: di<GetRecentlyTranslateCubit>()..getRecentlyTranslate(),
      child: SizedBox(
        height: HeightManager.h55,
        child:
            BlocBuilder<GetRecentlyTranslateCubit, GetRecentlyTranslateState>(
          builder: (context, state) {
            if (state is GetRecentlyTranslateError) {
              return Center(
                child: Text(
                  state.errMessage,
                  style: TextStyleManager.light12(
                    color: ColorManager.black,
                  ),
                ),
              );
            } else if (state is GetRecentlyTranslateLoading) {
              return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 3,
                itemBuilder: (context, index) {
                  return CustomCardOfRecentalySavedItemHomeLoading();
                },
              );
            }
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: GetRecentlyTranslateCubit.get(context)
                  .recentlyTranslateModel
                  .translations
                  .length,
              itemBuilder: (context, index) {
                return CustomCardOfRecentalySavedItemHome(
                  time: GetRecentlyTranslateCubit.get(context)
                      .recentlyTranslateModel
                      .translations[index]
                      .timestamp!,
                  title: GetRecentlyTranslateCubit.get(context)
                          .recentlyTranslateModel
                          .translations[index]
                          .text ??
                      GetRecentlyTranslateCubit.get(context)
                          .recentlyTranslateModel
                          .translations[index]
                          .originalText!,
                  image: GetRecentlyTranslateCubit.get(context)
                      .recentlyTranslateModel
                      .translations[index]
                      .thumbnailUrl!,
                );
              },
            );
          },
        ),
      ),
    );
    // return Row(
    //   children: [
    //     Expanded(
    //       child: Column(
    //         crossAxisAlignment: CrossAxisAlignment.start,
    //         children: [
    //           Row(
    //             spacing: WidthManager.w6,
    //             children: [
    //               Container(
    //                 height: HeightManager.h26,
    //                 width: HeightManager.h26,
    //                 decoration: BoxDecoration(
    //                   color: ColorManager.primaryColorlight7,
    //                   borderRadius: BorderRadius.circular(
    //                     RaduisValueManager.r2,
    //                   ),
    //                 ),
    //                 child: SvgPicture.asset(
    //                   IconManager.texticon,
    //                   fit: BoxFit.scaleDown,
    //                 ),
    //               ),
    //               Text(
    //                 "help-me.txt",
    //                 style: TextStyleManager.medium13(
    //                   color: ColorManager.primaryColorlight3,
    //                 ),
    //               ),
    //             ],
    //           ),
    //           SizedBox(
    //             height: HeightManager.h5,
    //           ),
    //           Text(
    //             "Today",
    //             style: TextStyleManager.light13(
    //               fontFamily: FontFamilyManger.avenirLTStd,
    //               color: ColorManager.gray14,
    //             ),
    //           )
    //         ],
    //       ),
    //     ),
    //     Expanded(
    //       child: Column(
    //         crossAxisAlignment: CrossAxisAlignment.start,
    //         children: [
    //           Row(
    //             spacing: WidthManager.w6,
    //             children: [
    //               Container(
    //                 height: HeightManager.h26,
    //                 width: HeightManager.h26,
    //                 decoration: BoxDecoration(
    //                   color: ColorManager.primaryColorlight7,
    //                   borderRadius: BorderRadius.circular(
    //                     RaduisValueManager.r2,
    //                   ),
    //                 ),
    //                 child: SvgPicture.asset(
    //                   IconManager.voiceicon,
    //                   fit: BoxFit.scaleDown,
    //                 ),
    //               ),
    //               Text(
    //                 "voiceclip12-47",
    //                 style: TextStyleManager.medium13(
    //                   color: ColorManager.primaryColorlight3,
    //                 ),
    //               ),
    //             ],
    //           ),
    //           SizedBox(
    //             height: HeightManager.h5,
    //           ),
    //           Text(
    //             "2d ago",
    //             style: TextStyleManager.light13(
    //               fontFamily: FontFamilyManger.avenirLTStd,
    //               color: ColorManager.gray14,
    //             ),
    //           )
    //         ],
    //       ),
    //     ),
    //   ],
    // );
  }
}
