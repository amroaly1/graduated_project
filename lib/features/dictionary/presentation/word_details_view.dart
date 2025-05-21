import 'package:flutter/material.dart';
import 'package:graduate_project/features/dictionary/data/model/dictionary_item_model.dart';
import 'package:graduate_project/features/dictionary/presentation/widget/word_details_body.dart';

class WordDetailsView extends StatelessWidget {
  const WordDetailsView({super.key, required this.word});
  final DictionaryItemModel word;
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: WordDetailsBody(),
    );
  }
}
