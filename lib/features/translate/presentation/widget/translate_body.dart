import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graduate_project/core/dependency_injection/di.dart';
import 'package:graduate_project/core/helper/show_snack_bar.dart';
import 'package:graduate_project/core/resource/color_manager.dart';
import 'package:graduate_project/core/resource/distance_manager.dart';
import 'package:graduate_project/core/resource/font_family_manger.dart';
import 'package:graduate_project/core/resource/icon_manager.dart';
import 'package:graduate_project/core/resource/string_manager.dart';
import 'package:graduate_project/core/resource/text_style_manager.dart';
import 'package:graduate_project/core/widget/custom_chat_text_field_send.dart';
import 'package:graduate_project/features/translate/manager/chat_cubit/translate_cubit.dart';
import 'package:graduate_project/core/manager/mic_cubit/mic_cubit.dart';
import 'package:graduate_project/features/home/manager/home_cubit/cubit/home_cubit.dart';
import 'package:graduate_project/features/home/manager/home_cubit/cubit/home_state.dart';

class TranslateBody extends StatelessWidget {
  const TranslateBody({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(
          value: di<TranslateCubit>(),
        ),
        BlocProvider.value(
          value: di<MicCubit>(),
        ),
      ],
      child: Builder(builder: (context) {
        return Column(
          children: [
            SafeArea(
              child: Container(
                color: ColorManager.whight2,
                width: double.infinity,
                padding: EdgeInsets.symmetric(
                  horizontal: WidthManager.w16,
                  vertical: HeightManager.h29,
                ),
                alignment: Alignment.center,
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CustomLanguageCard(
                        language: StringManager.en,
                        icon: IconManager.unitedstate,
                      ),
                      SvgPicture.asset(
                        IconManager.arrowrightarrowleft,
                      ),
                      CustomLanguageCard(
                        language: StringManager.asl,
                        icon: IconManager.asl,
                      ),
                      InkWell(
                        onTap:
                            TranslateCubit.get(context).addToFavoriteOrRemove,
                        child: BlocConsumer<TranslateCubit, TranslateState>(
                          listener: (context, state) {
                            if (state is ChatAddToFavoriteOrRemoveFailing) {
                              showSnackBar(context, message: state.errMessage);
                            }
                          },
                          builder: (context, state) {
                            return Icon(
                              TranslateCubit.get(context).chatModel == null
                                  ? Icons.bookmark_outline
                                  : TranslateCubit.get(context)
                                              .chatModel!
                                              .isSaved ==
                                          true
                                      ? Icons.bookmark
                                      : Icons.bookmark_outline,
                              size: HeightManager.h26,
                              color: ColorManager.primaryColor,
                            );
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Expanded(child: BlocBuilder<TranslateCubit, TranslateState>(
              builder: (context, state) {
                if (state is ChatInitial) {
                  return SizedBox();
                }
                if (state is ChatFailing) {
                  return Center(child: Text(state.errMessage));
                } else if (state is ChatLoading) {
                  return const Center(child: CircularProgressIndicator());
                }
                return Container(
                  alignment: Alignment.center,
                  child: TranslateCubit.get(context).imageBytes == null
                      ? SizedBox()
                      : Image.memory(TranslateCubit.get(context).imageBytes!),
                );
              },
            )),
            Padding(
              padding: EdgeInsets.only(bottom: HeightManager.h8),
              child: CustomChatTextFieldSend(
                controller: TranslateCubit.get(context).controller,
                onTapSend: TranslateCubit.get(context).chat,
              ),
            ),
            BlocBuilder<HomeCubit, HomeState>(
              builder: (context, state) {
                return SizedBox(
                  height: HomeCubit.get(context).isShowBottomNavigationBar
                      ? HeightManager.h60
                      : 0,
                );
              },
            ),
          ],
        );
      }),
    );
  }
}

class CustomLanguageCard extends StatelessWidget {
  const CustomLanguageCard({
    super.key,
    required this.language,
    required this.icon,
  });
  final String language;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: WidthManager.w24,
        vertical: HeightManager.h6,
      ),
      decoration: BoxDecoration(
        color: ColorManager.whight,
        borderRadius: BorderRadius.circular(
          RaduisValueManager.r8,
        ),
      ),
      child: Row(
        children: [
          SvgPicture.asset(icon),
          SizedBox(
            width: WidthManager.w10,
          ),
          Text(
            language,
            style: TextStyleManager.medium20(
              fontFamily: FontFamilyManger.hvDTrialBrandonGrotesque,
              color: ColorManager.black,
            ),
          ),
        ],
      ),
    );
  }
}
