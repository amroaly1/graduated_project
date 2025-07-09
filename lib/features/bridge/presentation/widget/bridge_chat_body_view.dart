import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:graduate_project/core/resource/distance_manager.dart';
import 'package:graduate_project/core/resource/padding_manager.dart';
import 'package:graduate_project/core/resource/string_manager.dart';
import 'package:graduate_project/core/widget/app_bar_of_chat.dart';
import 'package:graduate_project/core/widget/custom_chat_card.dart';
import 'package:graduate_project/core/widget/custom_chat_text_field_send.dart';

class BridgeChatBodyView extends StatelessWidget {
  const BridgeChatBodyView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AppBarOfChat(
            title: StringManager.bridge,
          ),
          Expanded(
            child: Padding(
              padding: PaddingManager.paddingHorizontal16,
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return CustomChatCard(
                    isStart: index == 0,
                    fromMe: index % 2 == 0,
                    message: "Hello, what about you ?",
                    dateTime: "2025-07-09T13:13:07.047078",
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: HeightManager.h11),
            child: CustomChatTextFieldSend(
              // TODO : use this function to communitcate with api
              onTapSend: () {},
              onChanged: (p0) {
                log("message $p0");
              },
              //TODO : give this controller
              controller: TextEditingController(),
            ),
          ),
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
