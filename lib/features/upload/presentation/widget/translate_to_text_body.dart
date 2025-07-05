import 'package:flutter/material.dart';
import 'package:graduate_project/features/upload/presentation/widget/body_section_of_translate_to_text.dart';
import 'package:graduate_project/features/upload/presentation/widget/general_body_of_translate_to_audio_or_text.dart';

class TranslateToTextBody extends StatelessWidget {
  const TranslateToTextBody({super.key});

  @override
  Widget build(BuildContext context) {
    return GeneralBodyOfTranslateToAudioOrText(
      bodySection: BodySectionOfTranaslateToText(),
    );
  }
}
