import 'package:flutter/material.dart';
import 'package:graduate_project/features/stream/presentation/widget/video_to_text_body.dart';

class VideoToTextView extends StatelessWidget {
  const VideoToTextView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: VideoToTextBody(),
    );
  }
}
