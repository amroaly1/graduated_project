import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graduate_project/core/dependency_injection/di.dart';
import 'package:graduate_project/core/resource/color_manager.dart';
import 'package:graduate_project/core/resource/distance_manager.dart';
import 'package:graduate_project/core/resource/icon_manager.dart';
import 'package:graduate_project/core/resource/string_manager.dart';
import 'package:graduate_project/core/resource/text_style_manager.dart';
import 'package:graduate_project/core/route/navigation_manager.dart';
import 'package:graduate_project/core/route/screen_manager.dart';
import 'package:graduate_project/features/home/manager/home_cubit/cubit/home_cubit.dart';
import 'package:graduate_project/features/home/manager/recentaly_chat_cubit/recentaly_chat_cubit.dart';
import 'package:graduate_project/features/home/presentation/widget/custom_home_card.dart';
import 'package:intl/intl.dart';
import 'package:redacted/redacted.dart';

class RecentlyChat extends StatelessWidget {
  const RecentlyChat({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: di<RecentalyChatCubit>()..init(),
      child: Builder(builder: (context) {
        return SizedBox(
          width: double.infinity,
          height: HeightManager.h230,
          child: CustomHomeCard(
            body: Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: HeightManager.h34,
                    child: Stack(
                      children: [
                        Positioned(
                          bottom: 0,
                          top: HeightManager.h13,
                          right: 0,
                          left: 0,
                          child: Divider(
                            color: ColorManager.gray20,
                            height: HeightManager.h5,
                            thickness: HeightManager.h2,
                          ),
                        ),
                        BlocBuilder<RecentalyChatCubit, RecentalyChatState>(
                          builder: (context, state) {
                            return ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount:
                                  RecentalyChatCubit.get(context).list.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: EdgeInsets.only(
                                    right: WidthManager.w16,
                                  ),
                                  child: InkWell(
                                    onTap: () {
                                      RecentalyChatCubit.get(context)
                                          .changeCurrentIndex(index);
                                    },
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          RecentalyChatCubit.get(context)
                                              .list[index],
                                          style: TextStyleManager.semiBold11(
                                            color:
                                                RecentalyChatCubit.get(context)
                                                            .currentIndex ==
                                                        index
                                                    ? ColorManager.primaryColor
                                                    : ColorManager.gray2,
                                          ),
                                        ),
                                        SizedBox(
                                          height: HeightManager.h2,
                                        ),
                                        AnimatedContainer(
                                          duration:
                                              const Duration(microseconds: 500),
                                          width: WidthManager.w95,
                                          height: HeightManager.h2,
                                          decoration: BoxDecoration(
                                            color:
                                                RecentalyChatCubit.get(context)
                                                            .currentIndex ==
                                                        index
                                                    ? ColorManager.primaryColor
                                                    : Colors.transparent,
                                            borderRadius: BorderRadius.circular(
                                              RaduisValueManager.r5,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: HeightManager.h5,
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: WidthManager.w10),
                    child: InkWell(
                      onTap: () {
                        HomeCubit.get(context).chnageCurrentIndex(
                          RecentalyChatCubit.get(context).currentIndex + 1,
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        spacing: WidthManager.w6,
                        children: [
                          InkWell(
                            onTap: () {
                              if (RecentalyChatCubit.get(context)
                                      .currentIndex ==
                                  1) {
                                NavigationManager.push(
                                    context: context,
                                    screen: ScreenManager.chatingWitAiView,
                                    arguments: RecentalyChatCubit.get(context)
                                        .signGPTHomeResponse
                                        ?.chatId);
                              }
                            },
                            child: Text(
                              "View Full Chat",
                              style: TextStyleManager.regular10(
                                color: ColorManager.primaryColor,
                              ),
                            ),
                          ),
                          SvgPicture.asset(
                            IconManager.arrowRight,
                            height: HeightManager.h7,
                            width: WidthManager.w7,
                            colorFilter: ColorFilter.mode(
                              ColorManager.primaryColor,
                              BlendMode.srcIn,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: HeightManager.h5,
                  ),
                  BlocBuilder<RecentalyChatCubit, RecentalyChatState>(
                    builder: (context, state) {
                      if (state is RecentlyChatLoadingState) {
                        return Expanded(
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                CustomChatCardLoading(
                                  fromMe: true,
                                  message: "Hello bro, what about you ?",
                                  time: "July 5, 2025 - 4:00 PM",
                                ),
                                CustomChatCardLoading(
                                  fromMe: false,
                                  message:
                                      "I’m Good bro, what about you also ?",
                                  time: "July 5, 2025 - 4:03 PM",
                                ),
                              ],
                            ),
                          ),
                        );
                      }
                      if (state is RecentlyChatErrorState) {
                        return Expanded(
                          child: Center(
                            child: Text(state.errMessage),
                          ),
                        );
                      }
                      if (RecentalyChatCubit.get(context).currentIndex == 1 &&
                          RecentalyChatCubit.get(context).signGPTHomeResponse !=
                              null) {
                        return Expanded(
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                CustomChatCard(
                                  fromMe: true,
                                  message: RecentalyChatCubit.get(context)
                                      .signGPTHomeResponse!
                                      .userPrompt,
                                  time: RecentalyChatCubit.get(context)
                                      .signGPTHomeResponse!
                                      .userTimestamp,
                                ),
                                CustomChatCard(
                                  fromMe: false,
                                  message: RecentalyChatCubit.get(context)
                                      .signGPTHomeResponse!
                                      .assistantResponse,
                                  time: RecentalyChatCubit.get(context)
                                      .signGPTHomeResponse!
                                      .assistantTimestamp,
                                ),
                              ],
                            ),
                          ),
                        );
                      }
                      return Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              CustomChatCard(
                                fromMe: true,
                                message: "Hello bro, what about you ?",
                                time: "2025-07-09T17:42:20.549531",
                              ),
                              CustomChatCard(
                                fromMe: false,
                                message: "I’m Good bro, what about you also ?",
                                time: "2025-07-09T17:42:20.549531",
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                  SizedBox(
                    height: HeightManager.h2,
                  ),
                ],
              ),
            ),
            title: StringManager.recentlyChats,
            button: IconButton(onPressed: () {}, icon: SizedBox()),
          ),
        );
      }),
    );
  }
}

class CustomChatCard extends StatelessWidget {
  const CustomChatCard({
    super.key,
    required this.fromMe,
    required this.message,
    required this.time,
  });

  final bool fromMe;
  final String message;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: HeightManager.h5,
      ),
      child: Align(
        alignment: fromMe
            ? AlignmentDirectional.centerStart
            : AlignmentDirectional.centerEnd,
        child: Padding(
          padding: EdgeInsets.only(
            right: fromMe ? 0 : WidthManager.w10,
            left: fromMe ? 0 : WidthManager.w10,
          ),
          child: Column(
            crossAxisAlignment:
                fromMe ? CrossAxisAlignment.start : CrossAxisAlignment.end,
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                  vertical: HeightManager.h5,
                  horizontal: WidthManager.w10,
                ),
                decoration: BoxDecoration(
                  color: fromMe
                      ? ColorManager.primaryColorlight7
                      : ColorManager.primaryColorlight8,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(
                      RaduisValueManager.r10,
                    ),
                    topRight: Radius.circular(
                      RaduisValueManager.r10,
                    ),
                    bottomRight: fromMe
                        ? Radius.circular(
                            RaduisValueManager.r10,
                          )
                        : Radius.zero,
                    bottomLeft: fromMe
                        ? Radius.zero
                        : Radius.circular(
                            RaduisValueManager.r10,
                          ),
                  ),
                ),
                child: Wrap(
                  children: [
                    Text(
                      message,
                      style: TextStyleManager.regular10(
                        color: ColorManager.gray21,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: HeightManager.h2,
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: fromMe ? WidthManager.w10 : 0,
                  right: fromMe ? 0 : WidthManager.w10,
                ),
                child: Text(
                  DateFormat.jm().format(DateTime.parse(time)),
                  style: TextStyleManager.light7(
                    color: ColorManager.gray2,
                  ),
                  textAlign: fromMe ? TextAlign.left : TextAlign.right,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomChatCardLoading extends StatelessWidget {
  const CustomChatCardLoading({
    super.key,
    required this.fromMe,
    required this.message,
    required this.time,
  });

  final bool fromMe;
  final String message;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: HeightManager.h5,
      ),
      child: Align(
        alignment: fromMe
            ? AlignmentDirectional.centerStart
            : AlignmentDirectional.centerEnd,
        child: Padding(
          padding: EdgeInsets.only(
            right: fromMe ? 0 : WidthManager.w10,
          ),
          child: Column(
            crossAxisAlignment:
                fromMe ? CrossAxisAlignment.start : CrossAxisAlignment.end,
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                  vertical: HeightManager.h5,
                  horizontal: WidthManager.w10,
                ),
                decoration: BoxDecoration(
                  color: fromMe
                      ? ColorManager.primaryColorlight7
                      : ColorManager.primaryColorlight8,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(
                      RaduisValueManager.r10,
                    ),
                    topRight: Radius.circular(
                      RaduisValueManager.r10,
                    ),
                    bottomRight: fromMe
                        ? Radius.circular(
                            RaduisValueManager.r10,
                          )
                        : Radius.zero,
                    bottomLeft: fromMe
                        ? Radius.zero
                        : Radius.circular(
                            RaduisValueManager.r10,
                          ),
                  ),
                ),
                child: Wrap(
                  children: [
                    Text(
                      message,
                      style: TextStyleManager.regular10(
                        color: ColorManager.gray21,
                      ),
                    ).redacted(
                      context: context,
                      redact: true,
                      configuration: RedactedConfiguration(
                        animationDuration:
                            const Duration(milliseconds: 800), //default
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: HeightManager.h2,
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: fromMe ? WidthManager.w10 : 0,
                  right: fromMe ? 0 : WidthManager.w10,
                ),
                child: Text(
                  time,
                  style: TextStyleManager.light7(
                    color: ColorManager.gray2,
                  ),
                  textAlign: fromMe ? TextAlign.left : TextAlign.right,
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
        ),
      ),
    );
  }
}











/*

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

Row(
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

    */