import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduate_project/core/helper/show_snack_bar.dart';
import 'package:graduate_project/core/resource/padding_manager.dart';
import 'package:graduate_project/core/widget/custom_chat_card.dart';
import 'package:graduate_project/core/widget/custom_chat_text_field_send.dart';
import 'package:graduate_project/features/chat_with_ai/manager/chat_list_view_cubit/chat_list_view_cubit.dart';
import 'package:graduate_project/features/saving/presentation/widget/custom_failing_body.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

class ChatWitAiBodyView extends StatelessWidget {
  const ChatWitAiBodyView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Padding(
              padding: PaddingManager.paddingHorizontal16,
              child: BlocConsumer<ChatListViewCubit, ChatListViewState>(
                listener: (context, state) {
                  if (state is ChatListViewAddItemFailing) {
                    showSnackBar(context, message: state.errMessage);
                  }
                },
                builder: (context, state) {
                  if (state is ChatListViewFailing) {
                    return CustomFailingBody(error: state.errMessage);
                  }

                  if (state is ChatListViewLoading) {
                    return ListView.builder(
                      itemCount: 10,
                      itemBuilder: (context, index) => CustomChatCardLoading(
                        isStart: index == 0,
                        fromMe: index % 2 == 0,
                      ),
                    );
                  }
                  if (state is ChatListViewSearchSccess) {
                    return ListView.builder(
                      itemCount: ChatListViewCubit.get(context).messages.length,
                      itemBuilder: (context, index) => AutoScrollTag(
                        key: ValueKey(index),
                        highlightColor: Colors.amber,
                        controller:
                            ChatListViewCubit.get(context).scrollController,
                        index: index,
                        child: CustomChatCard(
                          isStart: index == 0,
                          fromMe: index % 2 == 0,
                          message: ChatListViewCubit.get(context)
                              .messages[index]
                              .content,
                          dateTime: ChatListViewCubit.get(context)
                              .messages[index]
                              .timestamp,
                        ),
                      ),
                    );
                  }

                  log((state is ChatListViewAddItemLoading).toString());
                  return ListView.builder(
                    itemCount: state is ChatListViewAddItemLoading
                        ? ChatListViewCubit.get(context).messages.length + 1
                        : ChatListViewCubit.get(context).messages.length,
                    controller: ChatListViewCubit.get(context).scrollController,
                    itemBuilder: (context, index) {
                      if (state is ChatListViewAddItemLoading &&
                          index ==
                              ChatListViewCubit.get(context).messages.length) {
                        return CustomChatCardLoading(
                          isStart: index == 0,
                          fromMe: false,
                        );
                      }
                      return CustomChatCard(
                        isStart: index == 0,
                        fromMe: index % 2 == 0,
                        message: ChatListViewCubit.get(context)
                            .messages[index]
                            .content,
                        dateTime: ChatListViewCubit.get(context)
                            .messages[index]
                            .timestamp,
                      );
                    },
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(0),
            // padding: EdgeInsets.only(bottom: HeightManager.h11),
            child: CustomChatTextFieldSend(
              // TODO : use this function to communitcate with api
              onTapSend: () {
                ChatListViewCubit.get(context).addMessage();
              },

              onChanged: (text) {
                // log("${ChatListViewCubit.get(context).textController.text}");
                // log("text : $text");
              },
              //TODO : give this controller
              controller: ChatListViewCubit.get(context).textController,
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
