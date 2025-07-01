import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:graduate_project/core/resource/distance_manager.dart';
import 'package:graduate_project/core/resource/padding_manager.dart';
import 'package:graduate_project/core/widget/app_bar_of_chat.dart';
import 'package:graduate_project/core/widget/custom_chat_card.dart';
import 'package:graduate_project/core/widget/custom_chat_text_field_send.dart';

class ChatWitAiBodyView extends StatelessWidget {
  const ChatWitAiBodyView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AppBarOfChat(),
          Expanded(
            child: Padding(
              padding: PaddingManager.paddingHorizontal24,
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return CustomChatCard(
                    isStart: index == 0,
                    fromMe: index % 2 == 0,
                    message: index % 2 == 0
                        ? "Hello, what about you ?"
                        : "Hello, what about you ? Hello, what about you ? Hello, what about you ? Hello, what about you ? Hello, what about you ?",
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

// class ChatWithAiBodyMessages extends StatefulWidget {
//   const ChatWithAiBodyMessages({
//     super.key,
//   });

//   @override
//   State<ChatWithAiBodyMessages> createState() => _ChatWithAiBodyMessagesState();
// }

// class _ChatWithAiBodyMessagesState extends State<ChatWithAiBodyMessages> {
//   @override
//   void initState() {
//     _scrollDown();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       reverse: true,
//       controller: scrollcontroller,
//       itemCount: 10,
//       itemBuilder: (context, index) {
//         return CustomChatCard(
//           isStart: index == 0,
//           fromMe: index % 2 == 0,
//           message: index % 2 == 0
//               ? "Hello, what about you ?"
//               : "Hello, what about you ? Hello, what about you ? Hello, what about you ? Hello, what about you ? Hello, what about you ?",
//         );
//       },
//     );
//   }

//   final ScrollController scrollcontroller = ScrollController();

//   void _scrollDown() {
//     scrollcontroller.animateTo(
//       0,
//       duration: Duration(seconds: 2),
//       curve: Curves.fastOutSlowIn,
//     );
//   }
// }
