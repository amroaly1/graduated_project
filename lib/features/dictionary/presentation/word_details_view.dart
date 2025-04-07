import 'package:flutter/material.dart';
import 'package:graduate_project/features/dictionary/presentation/widget/word_details_body.dart';

class WordDetailsView extends StatelessWidget {
  const WordDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: WordDetailsBody(),
    );
  }
}
