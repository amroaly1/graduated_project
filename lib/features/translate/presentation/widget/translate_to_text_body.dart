import 'package:flutter/material.dart';
import 'package:graduate_project/features/translate/data/model/video_to_text_model.dart';
import 'package:graduate_project/features/translate/presentation/widget/body_section_of_translate_to_text.dart';
import 'package:graduate_project/features/translate/presentation/widget/general_body_of_translate_to_audio_or_text.dart';

class TranslateToTextBody extends StatelessWidget {
  const TranslateToTextBody({super.key, required this.videoToTextModel});
  final VideoToTextModel videoToTextModel;

  @override
  Widget build(BuildContext context) {
    return GeneralBodyOfTranslateToAudioOrText(
      bodySection: BodySectionOfTranaslateToText(
        data: videoToTextModel,
      ),
    );
  }
}
