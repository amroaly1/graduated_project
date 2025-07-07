import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduate_project/core/helper/date_of_day.dart';
import 'package:graduate_project/core/resource/color_manager.dart';
import 'package:graduate_project/core/resource/device_height_width_manager.dart';
import 'package:graduate_project/core/resource/distance_manager.dart';
import 'package:graduate_project/core/resource/font_family_manger.dart';
import 'package:graduate_project/core/resource/string_manager.dart';
import 'package:graduate_project/core/resource/text_style_manager.dart';
import 'package:graduate_project/core/route/navigation_manager.dart';
import 'package:graduate_project/core/route/screen_manager.dart';
import 'package:graduate_project/features/home/manager/home_dictionary/home_dictionary_cubit.dart';
import 'package:graduate_project/features/home/presentation/widget/custom_dictionary_home_card_loading.dart';
import 'package:redacted/redacted.dart';
import 'package:video_player/video_player.dart';

class CustomDictionaryHomeCard extends StatelessWidget {
  const CustomDictionaryHomeCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeDictionaryCubit, HomeDictionaryState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is GetDataLoading || state is GetDataFailing) {
          return CustomDictionaryHomeCardLoading();
        }
        return Container(
          width: double.infinity,
          padding: EdgeInsets.only(
            left: WidthManager.w16,
            right: WidthManager.w6,
            // top: HeightManager.h6,
            bottom: HeightManager.h15,
          ),
          decoration: BoxDecoration(
            color: ColorManager.whight,
            borderRadius: BorderRadius.circular(
              RaduisValueManager.r5,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    DateOfDay.getDataOfDay(),
                    style: TextStyleManager.semiBold10(),
                  ),
                  TextButton(
                    onPressed: () {
                      NavigationManager.push(
                          context: context,
                          screen: ScreenManager.signDictionaryView);
                    },
                    child: Text(
                      StringManager.seeDictionary,
                      style: TextStyleManager.regular10(
                        color: ColorManager.primaryColor,
                        fontFamily: FontFamilyManger.hvDTrialBrandonGrotesque,
                      ),
                    ),
                  ),
                ],
              ),
              Text(
                "Word of the Day : “${HomeDictionaryCubit.get(context).list[HomeDictionaryCubit.get(context).currentIndex].gloss}”",
                style: TextStyleManager.bold15(
                  height: 0,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  right: WidthManager.w10,
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: HeightManager.h5,
                    ),
                    HomeDictionaryCubit.get(context).isInitilalVideoInitilal()
                        ? Stack(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                    RaduisValueManager.r5,
                                  ),
                                ),
                                clipBehavior: Clip.antiAlias,
                                child: ConstrainedBox(
                                  constraints: BoxConstraints(
                                    maxHeight:
                                        DeviceHeightWidthManager.subOfHeight(
                                            context, HeightManager.h180),
                                    minHeight:
                                        DeviceHeightWidthManager.subOfHeight(
                                            context, HeightManager.h180),
                                    maxWidth: double.infinity,
                                  ),
                                  child: AspectRatio(
                                    aspectRatio:
                                        HomeDictionaryCubit.get(context)
                                            .videoController
                                            .value
                                            .aspectRatio,
                                    child: VideoPlayer(
                                      HomeDictionaryCubit.get(context)
                                          .videoController,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 0,
                                right: 0,
                                left: 0,
                                bottom: 0,
                                child: Center(
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: WidthManager.w6,
                                      vertical: HeightManager.h6,
                                    ),
                                    decoration: BoxDecoration(
                                      color: ColorManager.whight,
                                      shape: BoxShape.circle,
                                    ),
                                    child: InkWell(
                                      onTap: () {
                                        HomeDictionaryCubit.get(context)
                                            .changePlayOrStop();
                                      },
                                      child: Icon(
                                        HomeDictionaryCubit.get(context)
                                                .isVideoPlay()
                                            ? Icons.play_arrow
                                            : Icons.pause,
                                        color: ColorManager.primaryColor,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        : Container(
                            height: DeviceHeightWidthManager.subOfHeight(
                                context, HeightManager.h180),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                RaduisValueManager.r2,
                              ),
                            ),
                          ).redacted(
                            context: context,
                            redact: true,
                            configuration: RedactedConfiguration(
                              animationDuration:
                                  const Duration(milliseconds: 800), //default
                            ),
                          ),
                    SizedBox(
                      height: HeightManager.h10,
                    ),
                    SizedBox(
                      height: HeightManager.h29,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: HomeDictionaryCubit.get(context).list.length,
                        itemBuilder: (context, index) {
                          if (index ==
                              HomeDictionaryCubit.get(context).currentIndex) {
                            return SizedBox();
                          }
                          return InkWell(
                            splashColor: Colors.grey.shade400,
                            onTap: () {
                              HomeDictionaryCubit.get(context)
                                  .changeCurrentIndex(index);
                            },
                            child: Container(
                              margin: EdgeInsets.only(
                                right: WidthManager.w10,
                              ),
                              padding: EdgeInsets.symmetric(
                                horizontal: WidthManager.w21,
                                vertical: HeightManager.h2,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                    RaduisValueManager.r2),
                                color: ColorManager.gray12,
                              ),
                              child: Center(
                                child: Text(
                                  HomeDictionaryCubit.get(context)
                                      .list[index]
                                      .gloss,
                                  style: TextStyleManager.bold9(),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
