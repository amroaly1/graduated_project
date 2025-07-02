import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graduate_project/core/resource/color_manager.dart';
import 'package:graduate_project/core/resource/distance_manager.dart';
import 'package:graduate_project/core/resource/image_manager.dart';
import 'package:graduate_project/core/resource/string_manager.dart';
import 'package:graduate_project/core/resource/text_style_manager.dart';

class ContinueWhereYouLeftOff extends StatelessWidget {
  const ContinueWhereYouLeftOff({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: WidthManager.w10,
      children: [
        Expanded(
          flex: 3,
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: WidthManager.w10,
              vertical: HeightManager.h10,
            ),
            decoration: BoxDecoration(
              color: ColorManager.whight,
              borderRadius: BorderRadius.circular(
                RaduisValueManager.r5,
              ),
            ),
            child: Column(
              children: [
                Text(
                  StringManager.continueWhereYouLeftOff,
                  style: TextStyleManager.semiBold14(),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: ColorManager.primaryColorlight4,
                    borderRadius: BorderRadius.circular(
                      RaduisValueManager.r5,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: WidthManager.w10,
                      ),
                      Text(
                        "60% Uploading...",
                        style: TextStyleManager.semiBold12(),
                      ),
                      SizedBox(
                        width: WidthManager.w90,
                        child: CustomSlider(),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: HeightManager.h10,
                ),
                Row(
                  spacing: WidthManager.w10,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: WidthManager.w14,
                          vertical: HeightManager.h6,
                        ),
                        decoration: BoxDecoration(
                          color: ColorManager.primaryColorlight4,
                          borderRadius: BorderRadius.circular(
                            RaduisValueManager.r5,
                          ),
                        ),
                        child: Text(
                          StringManager.processing,
                          style: TextStyleManager.semiBold12(),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          vertical: HeightManager.h15,
                        ),
                        decoration: BoxDecoration(
                          color: ColorManager.primaryColorlight4,
                          borderRadius: BorderRadius.circular(
                            RaduisValueManager.r5,
                          ),
                        ),
                        child: Align(
                          alignment: Alignment.center,
                          child: Container(
                            width: WidthManager.w29,
                            height: HeightManager.h5,
                            decoration: BoxDecoration(
                              color: ColorManager.gray15,
                              borderRadius: BorderRadius.circular(
                                RaduisValueManager.r5,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: WidthManager.w6,
              vertical: HeightManager.h22,
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
                SvgPicture.asset(
                  ImageManager.homevideo,
                  height: HeightManager.h70,
                  fit: BoxFit.fill,
                ),
                SizedBox(
                  height: HeightManager.h10,
                ),
                Text(
                  "Lesson04",
                  style: TextStyleManager.semiBold12(
                    color: ColorManager.primaryColor,
                  ),
                ),
                Text(
                  "mp4",
                  style: TextStyleManager.semiBold10(),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class CustomSlider extends StatelessWidget {
  const CustomSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: SliderTheme.of(context).copyWith(
        trackHeight: HeightManager.h5,
        inactiveTrackColor: ColorManager.light5purpleColor, // light purple
        activeTrackColor: ColorManager.primaryColorlight5, // darker purple
        thumbColor: Colors.transparent,
        overlayColor: Colors.transparent,
        thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 0),
        trackShape: const RoundedRectSliderTrackShape(),
      ),
      child: Slider(
        value: 50,
        min: 0,
        max: 100,
        onChanged: (newValue) {},
      ),
    );
  }
}
