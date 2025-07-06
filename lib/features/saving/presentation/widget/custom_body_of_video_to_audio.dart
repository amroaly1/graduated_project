import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduate_project/core/dependency_injection/di.dart';
import 'package:graduate_project/features/saving/manager/video_to_audio_save/video_to_audio_save_cubit.dart';
import 'package:graduate_project/features/saving/presentation/widget/custom_card_of_video_to_audio.dart';
import 'package:graduate_project/features/saving/presentation/widget/custom_failing_body.dart';
import 'package:graduate_project/features/saving/presentation/widget/custom_loading_body.dart';

class CustomBodyOfVideoToAudio extends StatelessWidget {
  const CustomBodyOfVideoToAudio({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: di<VideoToAudioSaveCubit>()..init(),
      child: BlocBuilder<VideoToAudioSaveCubit, VideoToAudioSaveState>(
        builder: (context, state) {
          if (state is VideoToAudioSaveFailing) {
            return CustomFailingBody(error: state.errMessage);
          } else if (state is VideoToAudioSaveLoading) {
            return CustomLoadingBody();
          }
          return ListView.builder(
            itemCount: VideoToAudioSaveCubit.get(context)
                    .videoToAudioSaveModel
                    ?.translations
                    .length ??
                0,
            itemBuilder: (context, index) => CustomCardOfVideoToAudio(
              item: VideoToAudioSaveCubit.get(context)
                  .videoToAudioSaveModel!
                  .translations[index],
            ),
          );
        },
      ),
    );
  }
}
