import 'package:flutter/material.dart';
import 'package:graduate_project/features/upload/data/model/video_to_audio_model.dart';
import 'package:graduate_project/features/upload/presentation/widget/body_section_of_transalte_to_audio.dart';
import 'package:graduate_project/features/upload/presentation/widget/general_body_of_translate_to_audio_or_text.dart';

class TranslateToAudioBody extends StatelessWidget {
  const TranslateToAudioBody({super.key, required this.videoToAudioModel});
  final VideoToAudioModel videoToAudioModel;

  @override
  Widget build(BuildContext context) {
    return GeneralBodyOfTranslateToAudioOrText(
      bodySection: BodySectionOfTransalteToAudio(
        videoToAudioModel: videoToAudioModel,
      ),
    );
  }
}
