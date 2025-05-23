import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graduate_project/core/dependency_injection/di.dart';
import 'package:graduate_project/core/helper/show_snack_bar.dart';
import 'package:graduate_project/core/resource/color_manager.dart';
import 'package:graduate_project/core/resource/device_height_width_manager.dart';
import 'package:graduate_project/core/resource/distance_manager.dart';
import 'package:graduate_project/core/resource/font_family_manger.dart';
import 'package:graduate_project/core/resource/icon_manager.dart';
import 'package:graduate_project/core/resource/string_manager.dart';
import 'package:graduate_project/core/resource/text_style_manager.dart';
import 'package:graduate_project/features/chat/manager/cubit/chat_cubit.dart';
import 'package:graduate_project/features/home/manager/home_cubit/cubit/home_cubit.dart';
import 'package:graduate_project/features/home/manager/home_cubit/cubit/home_state.dart';

class ChatBody extends StatelessWidget {
  const ChatBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: di<ChatCubit>(),
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
                        onTap: ChatCubit.get(context).addToFavoriteOrRemove,
                        child: BlocConsumer<ChatCubit, ChatState>(
                          listener: (context, state) {
                            if (state is ChatAddToFavoriteOrRemoveFailing) {
                              showSnackBar(context, message: state.errMessage);
                            }
                          },
                          builder: (context, state) {
                            return Icon(
                              ChatCubit.get(context).chatModel == null
                                  ? Icons.bookmark_outline
                                  : ChatCubit.get(context).chatModel!.isSaved ==
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
            Expanded(child: BlocBuilder<ChatCubit, ChatState>(
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
                  child: Image.memory(ChatCubit.get(context).imageBytes!),
                );
              },
            )),
            Container(
              color: ColorManager.whight2,
              padding: EdgeInsets.only(
                right: WidthManager.w16,
                left: WidthManager.w16,
                bottom: HeightManager.h24,
                top: HeightManager.h20,
              ),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: WidthManager.w6,
                        vertical: HeightManager.h10,
                      ),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: ColorManager.whight,
                      ),
                      child: InkWell(
                        onTap: () {},
                        child: Icon(
                          Icons.mic_none_outlined,
                          size: HeightManager.h29,
                          color: ColorManager.purple2Color,
                        ),
                      ),
                    ),
                    SizedBox(width: WidthManager.w10),
                    SizedBox(
                      height: DeviceHeightWidthManager.subOfHeight(
                        context,
                        HeightOfDesign.h45,
                      ),
                      width:
                          (DeviceHeightWidthManager.deviceWidth(context) / 1.5),
                      child: TextField(
                        style: TextStyleManager.bold16(
                          color: ColorManager.black,
                        ),
                        controller: ChatCubit.get(context).controller,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: WidthManager.w21,
                            // vertical: HeightManager.h10,
                          ),
                          filled: true,
                          fillColor: ColorManager.whight,
                          border: oulineborder(),
                          hintText: StringManager.enterText,
                          hintStyle: TextStyleManager.bold16(
                            color: ColorManager.purple2Color,
                          ),
                          enabledBorder: oulineborder(),
                          focusedBorder: oulineborder(),
                        ),
                      ),
                    ),
                    SizedBox(width: WidthManager.w10),
                    InkWell(
                      onTap: ChatCubit.get(context).chat,
                      child: SvgPicture.asset(
                        IconManager.send,
                      ),
                    ),
                  ],
                ),
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

  OutlineInputBorder oulineborder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(
        RaduisValueManager.r30,
      ),
      borderSide: BorderSide(
        color: ColorManager.whight,
      ),
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
