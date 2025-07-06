import 'package:flutter/material.dart';
import 'package:graduate_project/core/helper/date_of_day.dart';
import 'package:graduate_project/core/resource/color_manager.dart';
import 'package:graduate_project/core/resource/device_height_width_manager.dart';
import 'package:graduate_project/core/resource/distance_manager.dart';
import 'package:graduate_project/core/resource/font_family_manger.dart';
import 'package:graduate_project/core/resource/string_manager.dart';
import 'package:graduate_project/core/resource/text_style_manager.dart';
import 'package:redacted/redacted.dart';

class CustomDictionaryHomeCardLoading extends StatelessWidget {
  const CustomDictionaryHomeCardLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
              ).redacted(
                context: context,
                redact: true,
                configuration: RedactedConfiguration(
                  animationDuration:
                      const Duration(milliseconds: 800), //default
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  StringManager.seeDictionary,
                  style: TextStyleManager.regular10(
                    color: ColorManager.primaryColor,
                    fontFamily: FontFamilyManger.hvDTrialBrandonGrotesque,
                  ),
                ).redacted(
                  context: context,
                  redact: true,
                  configuration: RedactedConfiguration(
                    animationDuration:
                        const Duration(milliseconds: 800), //default
                  ),
                ),
              ),
            ],
          ),
          Text(
            "Word of the Day : “Friend”",
            style: TextStyleManager.bold15(
              height: 0,
            ),
          ).redacted(
            context: context,
            redact: true,
            configuration: RedactedConfiguration(
              animationDuration: const Duration(milliseconds: 800), //default
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
                // false
                //     ? ConstrainedBox(
                //         constraints: BoxConstraints(
                //           maxHeight:
                //               DeviceHeightWidthManager.subOfHeight(
                //                   context, HeightManager.h180),
                //           minHeight:
                //               DeviceHeightWidthManager.subOfHeight(
                //                   context, HeightManager.h180),
                //           maxWidth: double.infinity,
                //         ),
                //         child: AspectRatio(
                //           aspectRatio: ShowWordCubit.get(context)
                //               .videoController
                //               .value
                //               .aspectRatio,
                //           child: VideoPlayer(
                //             ShowWordCubit.get(context).videoController,
                //           ),
                //         ),
                //       )
                //     :
                Container(
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
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return InkWell(
                        splashColor: Colors.grey.shade400,
                        onTap: () {},
                        child: Container(
                          margin: EdgeInsets.only(
                            right: WidthManager.w10,
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal: WidthManager.w21,
                            vertical: HeightManager.h2,
                          ),
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(RaduisValueManager.r2),
                            color: ColorManager.gray12,
                          ),
                          child: Center(
                            child: Text(
                              "Help",
                              style: TextStyleManager.bold9(),
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
  }
}
