import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduate_project/core/resource/color_manager.dart';
import 'package:graduate_project/core/resource/distance_manager.dart';
import 'package:graduate_project/core/resource/padding_manager.dart';
import 'package:graduate_project/core/resource/string_manager.dart';
import 'package:graduate_project/core/resource/text_style_manager.dart';
import 'package:graduate_project/core/route/navigation_manager.dart';
import 'package:graduate_project/core/widget/app_bar_of_chat.dart';
import 'package:graduate_project/core/widget/custom_chat_card.dart';
import 'package:graduate_project/core/widget/custom_chat_text_field_send.dart';
import 'package:graduate_project/features/bridge/manager/cubit/bridge_cubit.dart';
import 'package:graduate_project/features/saving/presentation/widget/custom_failing_body.dart';

class BridgeChatBodyView extends StatelessWidget {
  const BridgeChatBodyView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          BlocBuilder<BridgeCubit, BridgeState>(
            builder: (context, state) {
              return AppBarOfChat(
                startIcon: IconButton(
                  onPressed: () {
                    NavigationManager.pop(context: context);
                  },
                  icon: Icon(Icons.arrow_back),
                ),
                title: StringManager.bridge,
                endIcon: IconButton(
                  onPressed: BridgeCubit.get(context).connectOrDiconnect,
                  icon: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      BridgeCubit.get(context).isconnect
                          ? Container(
                              width: HeightManager.h15,
                              height: HeightManager.h15,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: ColorManager.green,
                              ),
                            )
                          : Icon(
                              Icons.warning,
                              size: HeightManager.h15,
                              color: ColorManager.red,
                            ),
                      SizedBox(
                        width: WidthManager.w3,
                      ),
                      Text(
                        BridgeCubit.get(context).isconnect
                            ? "Connected"
                            : "Disconnected",
                        style: TextStyleManager.semiBold8(
                          color: BridgeCubit.get(context).isconnect
                              ? ColorManager.green
                              : ColorManager.red,
                          height: 3,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
          Expanded(
            child: Padding(
              padding: PaddingManager.paddingHorizontal16,
              child: BlocBuilder<BridgeCubit, BridgeState>(
                builder: (context, state) {
                  if (state is GetAllChatLoadingState) {
                    return ListView.builder(
                      itemCount: 10,
                      itemBuilder: (context, index) => CustomChatCardLoading(
                        isStart: index == 0,
                        fromMe: index % 2 == 0,
                      ),
                    );
                  }
                  if (state is GetAllChatErrorState) {
                    return CustomFailingBody(error: state.errMessage);
                  }

                  return ListView.builder(
                    controller: BridgeCubit.get(context).scrollController,
                    itemCount: BridgeCubit.get(context).messages.length,
                    itemBuilder: (context, index) {
                      return CustomChatCard(
                        isStart: index == 0,
                        fromMe: BridgeCubit.get(context).messages[index].role ==
                            "user",
                        message:
                            BridgeCubit.get(context).messages[index].content,
                        dateTime:
                            BridgeCubit.get(context).messages[index].timestamp,
                      );
                    },
                  );
                },
              ),
            ),
          ),
          CustomChatTextFieldSend(
            onTapSend: BridgeCubit.get(context).sendMessage,
            onChanged: (p0) {
              log("message $p0");
            },
            controller: BridgeCubit.get(context).textController,
          ),
          // padding: EdgeInsets.only(bottom: HeightManager.h11),
          // BlocBuilder<HomeCubit, HomeState>(
          //   builder: (context, state) {
          //     return SizedBox(
          //       height: HomeCubit.get(context).isShowBottomNavigationBar
          //           ? HeightManager.h60
          //           : 0,
          //     );
          //   },
          // ),
        ],
      ),
    );
  }
}
