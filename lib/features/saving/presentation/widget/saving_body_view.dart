import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduate_project/core/constant/constant.dart';
import 'package:graduate_project/core/resource/color_manager.dart';
import 'package:graduate_project/core/resource/distance_manager.dart';
import 'package:graduate_project/core/resource/font_family_manger.dart';
import 'package:graduate_project/core/resource/padding_manager.dart';
import 'package:graduate_project/core/resource/string_manager.dart';
import 'package:graduate_project/core/resource/text_style_manager.dart';
import 'package:graduate_project/core/resource/time_manager.dart';
import 'package:graduate_project/core/widget/cutsom_app_bar_of_sub_page.dart';
import 'package:graduate_project/features/saving/manager/saving_cubit/saving_cubit.dart';

class SavingBodyView extends StatelessWidget {
  const SavingBodyView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CutsomAppBarOfSubPage(),
          SizedBox(
            height: HeightManager.h34,
          ),
          Padding(
            padding: PaddingManager.paddingHorizontal24,
            child: Text(
              StringManager.recentlySaved,
              style: TextStyleManager.bold20(
                fontFamily: FontFamilyManger.hvDTrialBrandonGrotesque,
                color: ColorManager.primaryColor,
              ),
              textAlign: TextAlign.start,
            ),
          ),
          SizedBox(
            height: HeightManager.h16,
          ),
          SizedBox(
            height: HeightManager.h34,
            width: double.infinity,
            child: BlocBuilder<SavingCubit, SavingState>(
              builder: (context, state) {
                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categoriesSaving.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () => SavingCubit.get(context)
                          .changeSavingIndex(index: index),
                      child: AnimatedContainer(
                        duration: TimeManager.mill500,
                        curve: Curves.elasticInOut,
                        margin: index == 0
                            ? EdgeInsets.only(left: WidthManager.w10)
                            : index == categoriesSaving.length - 1
                                ? EdgeInsets.only(right: WidthManager.w10)
                                : null,
                        padding: EdgeInsets.symmetric(
                          horizontal: WidthManager.w16,
                          vertical: HeightManager.h2,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            RaduisValueManager.r18,
                          ),
                          color: index ==
                                  SavingCubit.get(context).currentSavingIndex
                              ? ColorManager.primaryColor
                              : null,
                        ),
                        child: Text(
                          categoriesSaving[index],
                          style: TextStyleManager.medium14(
                            color: index ==
                                    SavingCubit.get(context).currentSavingIndex
                                ? ColorManager.whight
                                : ColorManager.black,
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
          SizedBox(
            height: HeightManager.h16,
          ),
          Expanded(child: BlocBuilder<SavingCubit, SavingState>(
            builder: (context, state) {
              return Padding(
                padding: PaddingManager.paddingHorizontal24,
                child: SavingCubit.get(context).buildSavingBody(),
              );
            },
          ))
        ],
      ),
    );
  }
}
