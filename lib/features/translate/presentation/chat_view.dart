import 'package:flutter/material.dart';
import 'package:graduate_project/features/translate/presentation/widget/chat_body.dart';

class ChatView extends StatelessWidget {
  const ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ChatBody(),
    );
  }
}
