import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduate_project/features/signGPT/data/model/chat_model.dart';
import 'package:graduate_project/features/signGPT/data/model/list_of_chat_model.dart';
import 'package:graduate_project/features/signGPT/data/repo/chat_repo.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
// import 'package:meta/meta.dart';

part 'chat_list_view_state.dart';

class ChatListViewCubit extends Cubit<ChatListViewState> {
  ChatListViewCubit(this.chatRepo) : super(ChatListViewInitial());
  static ChatListViewCubit get(context) => BlocProvider.of(context);

  late AutoScrollController scrollController;
  late TextEditingController textController;

  List<Messages> messages = [];
  ChatItem? chatItem;
  final ChatWitApiRepo chatRepo;

  void init({required int? chatId}) {
    scrollController = AutoScrollController();
    textController = TextEditingController();

    messages = [];
    chatItem = null;

    if (chatId != null) {
      getSpecficChat(chatId: chatId);
    }

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
      messages.add(Messages(
          role: "user",
          content: textController.text,
          timestamp: DateTime.now().toIso8601String()));

      getResponse(
        text: textController.text,
        chatId: chatItem?.chatId,
      );
      textController.clear();
      scrollToBottom();

      /// Wait for the UI to rebuild, then scroll
    }
  }

  void getResponse({
    required String text,
    required int? chatId,
  }) async {
    emit(ChatListViewAddItemLoading());
    log(chatId.toString());

    var response = await chatRepo.addMessage(message: text, chatId: chatId);
    response.fold((error) {
      messages.add(
        Messages(
          role: "assistant",
          content: error,
          timestamp: DateTime.now().toIso8601String(),
        ),
      );
      emit(ChatListViewAddItemFailing(errMessage: error));
    }, (r) {
      messages.add(
        Messages(
          role: "assistant",
          content: removeDoubleAsterisks(r.response),
          timestamp: r.timestamp,
        ),
      );

      chatItem ??= ChatItem(
          chatId: r.chatId, createdAt: '', title: r.title ?? "", updatedAt: '');

      emit(ChatListViewAddItemSuccess());
    });
  }

  String removeDoubleAsterisks(String input) {
    return input.replaceAll('**', '');
  }

  void createNewChat() {
    messages = [];
    chatItem = null;
    emit(ChatListViewCreateNewChat());
  }

  Future<void> getSpecficChat({required int chatId}) async {
    emit(ChatListViewLoading());

    var response = await chatRepo.getSpecificChat(chatId: chatId);
    response.fold((error) {
      emit(ChatListViewFailing(errMessage: error));
    }, (r) {
      messages = [];
      messages = r.messages;
      chatItem = ChatItem(
        chatId: r.chatId,
        createdAt: '',
        title: r.title,
        updatedAt: '',
      );
      scrollToBottom();
      emit(ChatListViewSuccess());
    });
  }

  void changeToSearchChat({
    required int chatId,
    required List<Messages> searchMessage,
    required String title,
  }) async {
    await getSpecficChat(chatId: chatId);
    if (messages.isEmpty) {
      log("No messages loaded");
      return;
    }

    int index = messages.indexWhere((item) {
      return item.content
          .toLowerCase()
          .contains(searchMessage.first.content.toLowerCase());
    });

    log("matched index: $index");

    if (index >= 0 && index < messages.length) {
      // First emit state to trigger list build
      emit(ChatListViewSearchSccess(index: index));

      // Then wait for frame build, then scroll
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        await scrollController.scrollToIndex(
          index,
          preferPosition: AutoScrollPosition.middle,
        );
        scrollController.highlight(index);
      });
    } else {
      log("Invalid index: $index");
    }
  }

  @override
  Future<void> close() {
    scrollController.dispose();
    textController.dispose();
    return super.close();
  }
}
