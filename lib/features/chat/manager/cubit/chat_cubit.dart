import 'dart:convert';
import 'dart:developer';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduate_project/core/service/speeach_to_text_service.dart';
import 'package:graduate_project/features/chat/data/model/chat_model.dart';
import 'package:graduate_project/features/chat/data/repo/chat_repo.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit({required this.repo}) : super(ChatInitial()) {
    init();
  }
  final ChatRepo repo;

  static ChatCubit get(context) => BlocProvider.of(context);

  TextEditingController controller = TextEditingController();
  ChatModel? chatModel;
  Uint8List? imageBytes;
  bool _speechEnabled = false;
  bool speechDied = false;
  bool startTransalte = false;

  void chat() async {
    if (controller.text.isNotEmpty) {
      emit(ChatLoading());
      var res = await repo.doChat(text: controller.text);
      res.fold((ifLeft) {
        emit(ChatFailing(errMessage: ifLeft));
      }, (ifRight) {
        // controller.text = '';
        imageBytes = base64Decode(ifRight.img);
        chatModel = ifRight;
        emit(ChatSuccess());
      });
    }
  }

  void addToFavoriteOrRemove() async {
    if (chatModel != null) {
      if (chatModel!.isSaved) {
        //delete
        log(chatModel!.translationId!.toString());
        delete(translationid: chatModel!.translationId!);
      } else {
        // save
        saveWord(word: chatModel!.originalText);
      }
    }
  }

  void saveWord({required String word}) async {
    var res = await repo.save(word: word);
    res.fold((ifLeft) {
      emit(ChatAddToFavoriteOrRemoveFailing(errMessage: ifLeft));
    }, (ifRight) {
      chatModel!.isSaved = true;
      chatModel!.translationId = ifRight.translationId;
      emit(ChatAddOrRemoveFavorite());
    });
  }

  void delete({required int translationid}) async {
    var res = await repo.delete(translationid: translationid);
    res.fold((ifLeft) {
      emit(ChatAddToFavoriteOrRemoveFailing(errMessage: ifLeft));
    }, (ifRight) {
      chatModel!.isSaved = false;
      chatModel!.translationId = null;
      emit(ChatAddOrRemoveFavorite());
    });
  }

  void init() async {
    bool permission = await SpeechToTextService.requestPermission();

    if (permission) {
      if (!_speechEnabled) {
        _speechEnabled = await SpeechToTextService.initSpeech();
      }
    } else {
      // change in ui
      speechDied = true;

      emit(ChatMicISDisabled());
    }
  }

  void startListening() async {
    // startTransalte = true;
    // emit(ChatMicAddText());
    await SpeechToTextService.startListening((result) {
      controller.text += result.recognizedWords;
      log(controller.text);

      startTransalte = false;
      // emit(ChatMicAddText());
    });
  }
}
