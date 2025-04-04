import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:graduate_project/core/resource/color_manager.dart';
import 'package:graduate_project/core/resource/device_height_width_manager.dart';
import 'package:graduate_project/core/resource/distance_manager.dart';
import 'package:graduate_project/core/resource/font_family_manger.dart';
import 'package:graduate_project/core/resource/icon_manager.dart';
import 'package:graduate_project/core/resource/padding_manager.dart';
import 'package:graduate_project/core/resource/string_manager.dart';
import 'package:graduate_project/core/resource/text_style_manager.dart';
import 'package:graduate_project/core/widget/default_button.dart';
import 'package:graduate_project/features/onboarding/data/model/on_boarding_model.dart';
import 'package:graduate_project/features/onboarding/manager/on_boarding_cubit/on_boarding_cubit.dart';
import 'package:graduate_project/features/onboarding/view/widget/back_ground_of_arrow.dart';
import 'package:graduate_project/features/onboarding/view/widget/custom_circle_indecator.dart';

class OnBoardingItem extends StatelessWidget {
  const OnBoardingItem({super.key, required this.item});
  final OnBoardingModel item;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: HeightManager.h49),
          Padding(
            padding: PaddingManager.paddingHorizontal24,
            child: Visibility(
              visible: OnBoardingCubit.get(context).skipVisibility(),
              maintainSize: true,
              maintainState: true,
              maintainAnimation: true,
              child: Align(
                alignment: Alignment.centerRight,
                child: InkWell(
                  onTap: () => OnBoardingCubit.get(context)
                      .navigatToWelcomeView(context),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: WidthManager.w21),
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(RaduisValueManager.r30),
                      color: ColorManager.whight1,
                    ),
                    child: Text(
                      StringManager.skip,
                      style: TextStyleManager.light24(),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: HeightManager.h29),
          Padding(
            padding: PaddingManager.paddingHorizontal24,
            child: SvgPicture.asset(
              item.image,
              height: DeviceHeightWidthManager.subOfHeight(
                context,
                HeightOfDesign.h309,
              ),
              width: DeviceHeightWidthManager.subOfWidth(
                context,
                WidthOfDesign.w378,
              ),
              // fit: BoxFit.fill,
            ),
          ),
          Spacer(
            flex: 2,
          ),
          Text(
            item.title,
            style: TextStyleManager.black32(),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: HeightManager.h32),
          Padding(
            padding: PaddingManager.paddingHorizontal24,
            child: Text(
              item.subTitle,
              style: TextStyleManager.medium24(
                fontFamily: FontFamilyManger.avenirLTStd,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: HeightManager.h42),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Visibility(
                visible: OnBoardingCubit.get(context).arrowBackVisisble(),
                maintainSize: true,
                maintainState: true,
                maintainAnimation: true,
                child: BackgroundOfArrow(
                  pathArrow: IconManager.arrowLeft,
                  onTap: OnBoardingCubit.get(context).goToPrevPage,
                ),
              ),
              CustomCircleIndecator(
                lenght: OnBoardingCubit.get(context).repo.list.length,
                currentIndex: OnBoardingCubit.get(context).currentIndex,
              ),
              Visibility(
                visible: OnBoardingCubit.get(context).arrowForwardVisisble(),
                maintainSize: true,
                maintainState: true,
                maintainAnimation: true,
                child: BackgroundOfArrow(
                  pathArrow: IconManager.arrowRight,
                  onTap: OnBoardingCubit.get(context).goToNextPage,
                ),
              ),
            ],
          ),
          SizedBox(height: HeightManager.h37),
          Visibility(
            visible: OnBoardingCubit.get(context).buttonVisisble(),
            maintainSize: true,
            maintainState: true,
            maintainAnimation: true,
            child: DefaultButton(
              text: StringManager.getStarted,
              onPressed: () =>
                  OnBoardingCubit.get(context).navigatToWelcomeView(context),
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
