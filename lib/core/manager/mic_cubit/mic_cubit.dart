import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduate_project/core/service/speeach_to_text_service.dart';
// ignore: depend_on_referenced_packages, unnecessary_import
import 'package:meta/meta.dart';

part 'mic_state.dart';

class MicCubit extends Cubit<MicState> {
  MicCubit() : super(MicInitial()) {
    init();
  }

  static MicCubit get(context) => BlocProvider.of(context);

  bool _speechEnabled = false;
  bool speechDied = false;
  bool startTransalte = false;

  void init() async {
    bool permission = await SpeechToTextService.requestPermission();

    if (permission) {
      if (!_speechEnabled) {
        _speechEnabled = await SpeechToTextService.initSpeech();
      }
    } else {
      // change in ui
      speechDied = true;

      emit(MicISDisabled());
    }
  }

  void startListening({required TextEditingController controller}) async {
    startTransalte = true;
    emit(MicAddText());
    await SpeechToTextService.startListening((result) {
      controller.text += result.recognizedWords;
      log(controller.text);

      startTransalte = false;
      emit(MicAddText());
    });
  }
}
