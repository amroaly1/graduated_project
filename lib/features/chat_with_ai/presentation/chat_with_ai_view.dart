import 'package:flutter/material.dart';
import 'package:graduate_project/features/chat_with_ai/presentation/widget/chat_wit_ai_body_view.dart';

class ChatWithAiView extends StatelessWidget {
  const ChatWithAiView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ChatWitAiBodyView(),
    );
  }
}
