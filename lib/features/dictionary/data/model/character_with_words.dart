import 'package:graduate_project/features/dictionary/data/model/word_model.dart';

class CharacterWithWords {
  final String char;
  final List<WordModel> words;

  CharacterWithWords({required this.char, required this.words});
}
