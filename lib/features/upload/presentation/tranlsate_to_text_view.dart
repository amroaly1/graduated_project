import 'package:flutter/material.dart';
import 'package:graduate_project/features/upload/data/model/video_to_text_model.dart';
import 'package:graduate_project/features/upload/presentation/widget/translate_to_text_body.dart';

class TranlsateToTextView extends StatelessWidget {
  const TranlsateToTextView({super.key, required this.data});
  final VideoToTextModel data;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TranslateToTextBody(
        videoToTextModel: data,
      ),
    );
  }
}
