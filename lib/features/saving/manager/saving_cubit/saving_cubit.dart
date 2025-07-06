import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduate_project/core/dependency_injection/di.dart';
import 'package:graduate_project/features/saving/manager/dictionary_saving_cubit/dictionary_saving_cubit.dart';
import 'package:graduate_project/features/saving/manager/video_to_audio_save/video_to_audio_save_cubit.dart';
import 'package:graduate_project/features/saving/manager/video_to_text_cubit/video_to_text_cubitt.dart';
import 'package:graduate_project/features/saving/presentation/widget/custom_body_of_dictioanry.dart';
import 'package:graduate_project/features/saving/presentation/widget/custom_body_of_video_to_audio.dart';
import 'package:graduate_project/features/saving/presentation/widget/custom_body_of_video_to_text.dart';
import 'package:graduate_project/features/saving/presentation/widget/custom_loading_body.dart';
// ignore: depend_on_referenced_packages, unnecessary_import
import 'package:meta/meta.dart';

part 'saving_state.dart';

class SavingCubit extends Cubit<SavingState> {
  SavingCubit() : super(SavingInitial());

  static SavingCubit get(context) => BlocProvider.of(context);

  int currentSavingIndex = 0;
  void init() {
    di<DictionarySavingCubit>().list = [];
    di<VideoToTextCubit>().videoToTextSaveModel = null;
    di<VideoToAudioSaveCubit>().videoToAudioSaveModel = null;
  }

  void changeSavingIndex({required int index}) {
    currentSavingIndex = index;
    emit(ChangeSavingIndex());
  }

  Widget buildSavingBody() {
    switch (currentSavingIndex) {
      case 0:

        //All
        return CustomLoadingBody();
      case 1:
        // Dictionar
        return CustomBodyOfDictioanry();
      case 2:
        // Video to Audio
        return CustomBodyOfVideoToAudio();
      case 3:
        // Video to text
        return CustomBodyOfVideoToText();
      default:
        return SizedBox();
    }
  }
}
