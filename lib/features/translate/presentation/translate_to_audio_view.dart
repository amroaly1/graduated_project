import 'package:flutter/material.dart';
import 'package:graduate_project/features/translate/data/model/video_to_audio_model.dart';
import 'package:graduate_project/features/translate/presentation/widget/translate_to_audio_body.dart';

class TranslateToAudioView extends StatelessWidget {
  const TranslateToAudioView({super.key, required this.videoToAudioModel});
  final VideoToAudioModel videoToAudioModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TranslateToAudioBody(
        videoToAudioModel: videoToAudioModel,
      ),
    );
  }
}
