import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduate_project/core/dependency_injection/di.dart';
import 'package:graduate_project/features/dictionary/data/model/dictionary_item_model.dart';
import 'package:graduate_project/features/dictionary/data/repo/dictionary_add_favorite_repo.dart';
import 'package:graduate_project/features/dictionary/data/repo/dictionary_word_repo.dart';
import 'package:graduate_project/features/dictionary/manager/show_word/show_word_cubit.dart';
import 'package:graduate_project/features/dictionary/presentation/widget/word_details_body.dart';

class WordDetailsView extends StatelessWidget {
  const WordDetailsView({super.key, required this.word});
  final DictionaryItemModel word;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ShowWordCubit(
        isFavorite: word.isFavorite,
        favoriteRepo: di<DictionaryAddFavoriteRepo>(),
        repo: di<DictionaryWordRepo>(),
      )
        ..getResentalySeacrh()
        ..initial(url: word.videoUrl),
      child: Scaffold(
        body: WordDetailsBody(
          word: word,
        ),
      ),
    );
  }
}
