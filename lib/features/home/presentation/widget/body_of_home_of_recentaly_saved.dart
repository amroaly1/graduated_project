import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduate_project/core/dependency_injection/di.dart';
import 'package:graduate_project/core/resource/color_manager.dart';
import 'package:graduate_project/core/resource/distance_manager.dart';
import 'package:graduate_project/core/resource/text_style_manager.dart';
import 'package:graduate_project/features/home/manager/get_recenly_saved_cubit/get_recently_saved_cubit.dart';
import 'package:graduate_project/features/home/presentation/widget/custom_card_of_recentaly_saved_item_home.dart';
import 'package:redacted/redacted.dart';

class BodyOfHomeRecentalySaved extends StatelessWidget {
  const BodyOfHomeRecentalySaved({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: di<GetRecentlySavedCubit>()..getRecentalySaved(),
      child: SizedBox(
        height: HeightManager.h55,
        child: BlocBuilder<GetRecentlySavedCubit, GetRecentlySavedState>(
          builder: (context, state) {
            if (state is GetRecentlySavedErrorState) {
              return Center(
                child: Text(
                  state.errMessage,
                  style: TextStyleManager.light12(
                    color: ColorManager.black,
                  ),
                ),
              );
            } else if (state is GetRecentlySavedLoadingState) {
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
              itemCount: GetRecentlySavedCubit.get(context)
                  .recentlySaveModel
                  .translations
                  .length,
              itemBuilder: (context, index) {
                return CustomCardOfRecentalySavedItemHome(
                  time: GetRecentlySavedCubit.get(context)
                      .recentlySaveModel
                      .translations[index]
                      .timestamp!,
                  title: GetRecentlySavedCubit.get(context)
                          .recentlySaveModel
                          .translations[index]
                          .text ??
                      GetRecentlySavedCubit.get(context)
                          .recentlySaveModel
                          .translations[index]
                          .originalText!,
                  image: GetRecentlySavedCubit.get(context)
                      .recentlySaveModel
                      .translations[index]
                      .thumbnailUrl!,
                );
              },
            );
          },
        ),
      ),
    );
  }
}

class CustomCardOfRecentalySavedItemHomeLoading extends StatelessWidget {
  const CustomCardOfRecentalySavedItemHomeLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: WidthManager.w10,
        right: WidthManager.w16,
        top: HeightManager.h10,
        bottom: HeightManager.h10,
      ),
      margin: EdgeInsets.only(right: WidthManager.w16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(RaduisValueManager.r10),
      ),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(shape: BoxShape.rectangle),
            height: HeightManager.h34,
            width: WidthManager.w35,
          ).redacted(
            context: context,
            redact: true,
            configuration: RedactedConfiguration(
              animationDuration: const Duration(milliseconds: 800), //default
            ),
          ),
          SizedBox(
            width: WidthManager.w6,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "title",
                style: TextStyleManager.bold10(),
              ).redacted(
                context: context,
                redact: true,
                configuration: RedactedConfiguration(
                  animationDuration:
                      const Duration(milliseconds: 800), //default
                ),
              ),
              Text(
                "DateFormat",
                style: TextStyleManager.semiBold8(),
              ).redacted(
                context: context,
                redact: true,
                configuration: RedactedConfiguration(
                  animationDuration:
                      const Duration(milliseconds: 800), //default
                ),
              ),
            ],
          )
        ],
      ),
    ).redacted(
      context: context,
      redact: true,
      configuration: RedactedConfiguration(
        animationDuration: const Duration(milliseconds: 800), //default
      ),
    );
  }
}
