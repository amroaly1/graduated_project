import 'dart:convert';
import 'dart:developer';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduate_project/features/translate/data/model/chat_model.dart';
import 'package:graduate_project/features/translate/data/repo/chat_repo.dart';

part 'chat_state.dart';

class TranslateCubit extends Cubit<TranslateState> {
  TranslateCubit({required this.repo}) : super(ChatInitial());
  final ChatRepo repo;

  static TranslateCubit get(context) => BlocProvider.of(context);

  TextEditingController controller = TextEditingController();
  ChatModel? chatModel;
  Uint8List? imageBytes;

  void chat() async {
    if (controller.text.isNotEmpty) {
      chatModel?.isSaved = false;
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
}
