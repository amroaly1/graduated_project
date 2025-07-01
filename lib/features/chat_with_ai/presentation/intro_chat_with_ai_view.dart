import 'package:flutter/material.dart';
import 'package:graduate_project/features/chat_with_ai/presentation/widget/intro_chat_with_ai_body_view.dart';

class IntroChatWithAiView extends StatelessWidget {
  const IntroChatWithAiView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: IntroChatWithAiBodyView(),
    );
  }
}
