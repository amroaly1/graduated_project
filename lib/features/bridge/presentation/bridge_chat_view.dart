import 'package:flutter/material.dart';
import 'package:graduate_project/features/bridge/presentation/widget/bridge_chat_body_view.dart';

class BridgeChatView extends StatelessWidget {
  const BridgeChatView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: BridgeChatBodyView(),
    );
  }
}
