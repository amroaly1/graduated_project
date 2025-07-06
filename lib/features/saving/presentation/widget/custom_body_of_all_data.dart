import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduate_project/features/saving/data/model/dictionary_saving_model.dart';
import 'package:graduate_project/features/saving/data/model/translation_saving_model.dart';
import 'package:graduate_project/features/saving/data/model/video_to_audio_save_model.dart';
import 'package:graduate_project/features/saving/data/model/video_to_text_save_model.dart';
import 'package:graduate_project/features/saving/manager/cubit/get_all_data_saving_cubit.dart';
import 'package:graduate_project/features/saving/presentation/widget/custom_card_of_dictaionry.dart';
import 'package:graduate_project/features/saving/presentation/widget/custom_card_of_translation.dart';
import 'package:graduate_project/features/saving/presentation/widget/custom_card_of_video_to_audio.dart';
import 'package:graduate_project/features/saving/presentation/widget/custom_card_of_video_to_text.dart';
import 'package:graduate_project/features/saving/presentation/widget/custom_failing_body.dart';
import 'package:graduate_project/features/saving/presentation/widget/custom_loading_body.dart';

class CustomBodyOfAllData extends StatelessWidget {
  const CustomBodyOfAllData({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAllDataSavingCubit, GetAllDataSavingState>(
      builder: (context, state) {
        if (state is GetAllDataSavingFailing) {
          return CustomFailingBody(error: state.errMessage);
        } else if (state is GetAllDataSavingLoading) {
          return CustomLoadingBody();
        }
        return ListView.builder(
          itemCount: GetAllDataSavingCubit.get(context)
                  .getAllDataModel
                  ?.translations
                  .length ??
              0,
          itemBuilder: (context, index) {
            if (GetAllDataSavingCubit.get(context)
                    .getAllDataModel
                    ?.translations[index]
                    .dictionaryEntryId !=
                null) {
              return CustomCardOfDictaionry(
                item: DictionarySavingModel(
                    id: int.parse(GetAllDataSavingCubit.get(context)
                        .getAllDataModel!
                        .translations[index]
                        .id!),
                    dictionaryEntryId: GetAllDataSavingCubit.get(context)
                        .getAllDataModel!
                        .translations[index]
                        .dictionaryEntryId!,
                    gloss: GetAllDataSavingCubit.get(context)
                        .getAllDataModel!
                        .translations[index]
                        .gloss!,
                    videoUrl: GetAllDataSavingCubit.get(context)
                        .getAllDataModel!
                        .translations[index]
                        .videoUrld!,
                    favoritedOn: GetAllDataSavingCubit.get(context)
                        .getAllDataModel!
                        .translations[index]
                        .favoritedOn!),
              );
            } else if (GetAllDataSavingCubit.get(context)
                    .getAllDataModel!
                    .translations[index]
                    .translationType ==
                "text") {
              return CustomCardOfVideoToText(
                item: TranslationsText(
                    id: GetAllDataSavingCubit.get(context)
                        .getAllDataModel!
                        .translations[index]
                        .id!
                        .toString(),
                    text: GetAllDataSavingCubit.get(context)
                        .getAllDataModel!
                        .translations[index]
                        .text!,
                    timestamp: GetAllDataSavingCubit.get(context)
                        .getAllDataModel!
                        .translations[index]
                        .timestamp!,
                    filename: GetAllDataSavingCubit.get(context)
                        .getAllDataModel!
                        .translations[index]
                        .filename!,
                    videoUrl: GetAllDataSavingCubit.get(context)
                        .getAllDataModel!
                        .translations[index]
                        .videoUrl!,
                    thumbnailUrl: GetAllDataSavingCubit.get(context)
                        .getAllDataModel!
                        .translations[index]
                        .thumbnailUrl!),
              );
            } else if (GetAllDataSavingCubit.get(context)
                    .getAllDataModel!
                    .translations[index]
                    .translationType ==
                "audio") {
              return CustomCardOfVideoToAudio(
                  item: TranslationsAudio(
                      text: GetAllDataSavingCubit.get(context)
                          .getAllDataModel!
                          .translations[index]
                          .text!,
                      id: GetAllDataSavingCubit.get(context)
                          .getAllDataModel!
                          .translations[index]
                          .id!
                          .toString(),
                      audioUrl: GetAllDataSavingCubit.get(context)
                          .getAllDataModel!
                          .translations[index]
                          .audioUrl!,
                      timestamp: GetAllDataSavingCubit.get(context)
                          .getAllDataModel!
                          .translations[index]
                          .timestamp!,
                      filename: GetAllDataSavingCubit.get(context)
                          .getAllDataModel!
                          .translations[index]
                          .filename!,
                      videoUrl: GetAllDataSavingCubit.get(context)
                          .getAllDataModel!
                          .translations[index]
                          .videoUrl!,
                      thumbnailUrl: GetAllDataSavingCubit.get(context)
                          .getAllDataModel!
                          .translations[index]
                          .thumbnailUrl!));
            } else if (GetAllDataSavingCubit.get(context)
                    .getAllDataModel!
                    .translations[index]
                    .translationType ==
                "animation") {
              return CustomCardOfTranslation(
                item: TranslationsTranslate(
                  hasThumbnail: GetAllDataSavingCubit.get(context)
                      .getAllDataModel!
                      .translations[index]
                      .hasThumbnail!,
                  hasAudio: GetAllDataSavingCubit.get(context)
                      .getAllDataModel!
                      .translations[index]
                      .hasAudio!,
                  audioUrl: GetAllDataSavingCubit.get(context)
                      .getAllDataModel!
                      .translations[index]
                      .audioUrl,
                  savedAt: GetAllDataSavingCubit.get(context)
                      .getAllDataModel!
                      .translations[index]
                      .savedAt!,
                  img: GetAllDataSavingCubit.get(context)
                      .getAllDataModel!
                      .translations[index]
                      .img!,
                  words: GetAllDataSavingCubit.get(context)
                      .getAllDataModel!
                      .translations[index]
                      .words!,
                  originalText: GetAllDataSavingCubit.get(context)
                      .getAllDataModel!
                      .translations[index]
                      .originalText!,
                  translationId: int.parse(GetAllDataSavingCubit.get(context)
                      .getAllDataModel!
                      .translations[index]
                      .translationId!),
                  thumbnailUrl: GetAllDataSavingCubit.get(context)
                      .getAllDataModel!
                      .translations[index]
                      .thumbnailUrl!,
                ),
              );
            } else {
              return SizedBox();
            }
          },
        );
      },
    );
  }
}
