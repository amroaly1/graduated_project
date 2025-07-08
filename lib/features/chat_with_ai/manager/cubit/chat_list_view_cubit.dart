import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:meta/meta.dart';

part 'chat_list_view_state.dart';

class ChatListViewCubit extends Cubit<ChatListViewState> {
  ChatListViewCubit() : super(ChatListViewInitial());
  static ChatListViewCubit get(context) => BlocProvider.of(context);

  late ScrollController scrollController;
  late TextEditingController textController;

  List<String> messages = [
    "Hello, what about you ?",
    "Hello, what about you ?",
    "Hello, what about you ?",
    "Hello, what about you ?",
    "Hello, what about you ?",
    "Hello, what about you ?",
    "Hello, what about you ?",
    "Hello, what about you ?",
    "Hello, what about you ?",
    "Hello, what about you ?",
    "Hello, what about you ?",
    "Hello, what about you ?",
  ];

  void init() {
    scrollController = ScrollController();
    textController = TextEditingController();
    scrollToBottom();

    emit(ChatListViewInitial());
  }

  void scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (scrollController.hasClients) {
        scrollController.animateTo(
          scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  void addMessage() {
    log("From Chat Cubit : ${textController.text}");
    if (textController.text.isNotEmpty) {
      messages.add(textController.text);
      textController.clear();

      emit(ChatListViewAddItemSuccess());

      /// Wait for the UI to rebuild, then scroll
    }
  }

  @override
  Future<void> close() {
    scrollController.dispose();
    textController.dispose();
    return super.close();
  }
}
