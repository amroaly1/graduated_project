import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduate_project/core/network/api_end_point.dart';
import 'package:graduate_project/features/bridge/data/model/bridge_response_model.dart';
import 'package:graduate_project/features/bridge/data/repo/get_all_bridge_chat_repo.dart';
import 'package:graduate_project/features/signGPT/data/model/chat_model.dart';
// ignore: depend_on_referenced_packages, unnecessary_import
import 'package:meta/meta.dart';
import 'package:web_socket_channel/io.dart';

part 'bridge_state.dart';

class BridgeCubit extends Cubit<BridgeState> {
  BridgeCubit(this.getALlBridgeChatRepo) : super(BridgeInitial());

  static BridgeCubit get(context) => BlocProvider.of(context);

  late ScrollController scrollController;
  late TextEditingController textController;

  IOWebSocketChannel? channel;

  final GetAllBridgeChatRepo getALlBridgeChatRepo;

  late List<Messages> messages;

  late bool isconnect;
  void init() async {
    messages = [];
    scrollController = ScrollController();
    textController = TextEditingController();
    isconnect = false;
    await reconnect();
    emit(BridgeInitial());
  }

  Future<void> reconnect() async {
    try {
      final socket = await WebSocket.connect(ApiEndPoint.streamBridge);
      channel = IOWebSocketChannel(socket);
      log(ApiEndPoint.streamBridge.toString());
      listenToStream();
      isconnect = true;
    } catch (e) {
      isconnect = false;
      emit(GetAllChatErrorState(errMessage: "Cannot connect"));
    }
    getAllChat();
    log("Start Listen");
    scrollToBottom();
  }

  void listenToStream() {
    channel?.stream.listen(
      (message) {
        log(message.toString());

        try {
          final decoded = jsonDecode(message);

          BridgeResponseModel model = BridgeResponseModel.fromJson(decoded);
          messages.add(Messages(
              role: model.deviceType,
              content: model.message,
              timestamp: model.timestamp));
        } catch (e) {
          log("Failed to decode message: $e");
        }

        emit(AddMessageSuccess());

        scrollToBottom();
      },
      onError: (error) {
        isconnect = false;
        emit(CloseConnectSuccess());
        log("WebSocket Error: $error");
        // Optionally emit an error state
      },
      onDone: () {
        isconnect = false;
        emit(CloseConnectSuccess());
        log("WebSocket closed");
        // Optionally handle reconnection
      },
      cancelOnError: true,
    );
  }

  void sendMessage() {
    log(isconnect.toString());
    if (!isconnect) {
      log("Cannot send: WebSocket not connected.");
      return;
    }
    if (textController.text.isEmpty) return;

    log("Is Send : ${textController.text}");

    final messageData = {
      "type": "broadcast",
      "message": textController.text,
    };

    final jsonMessage = jsonEncode(messageData);

    log("Sending: $jsonMessage");
    try {
      channel?.sink.add(jsonMessage);
    } catch (e) {
      isconnect = false;
      emit(CloseConnectSuccess());
    }

    messages.add(Messages(
        role: "user",
        content: textController.text,
        timestamp: DateTime.now().toIso8601String()));
    textController.clear();
    emit(AddMessageSuccess());

    scrollToBottom();
  }

  void getAllChat() async {
    emit(GetAllChatLoadingState());
    var result = await getALlBridgeChatRepo.getAllBridgeChat();
    result.fold((l) => emit(GetAllChatErrorState(errMessage: l)), (r) {
      messages = r;

      emit(GetAllChatSuccessState());
      scrollToBottom();
    });
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

  void closeConnection() {
    channel?.sink.close();
    isconnect = false;
    emit(CloseConnectSuccess());
  }

  void connectOrDiconnect() async {
    if (isconnect) {
      closeConnection();
    } else {
      await reconnect();
    }
  }

  @override
  Future<void> close() {
    channel?.sink.close();
    scrollController.dispose();
    textController.dispose();
    return super.close();
  }
}
