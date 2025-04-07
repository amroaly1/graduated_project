import 'package:graduate_project/features/dictionary/data/model/character_with_words.dart';
import 'package:graduate_project/features/dictionary/data/model/word_model.dart';

class SignDictionaryRepo {
  List<CharacterWithWords> data = [
    CharacterWithWords(
      char: "A",
      words: [
        WordModel(word: "Access", save: false),
        WordModel(word: "Awareness", save: false),
      ],
    ),
    CharacterWithWords(
      char: "B",
      words: [
        WordModel(word: "Body", save: false),
        WordModel(word: "Barrier", save: false),
      ],
    ),
    CharacterWithWords(
      char: "C",
      words: [
        WordModel(word: "Connection", save: false),
        WordModel(word: "Communication", save: false),
      ],
    ),
    CharacterWithWords(
      char: "D",
      words: [
        WordModel(word: "Dialogue", save: false),
        WordModel(word: "Deaf", save: false),
      ],
    ),
  ];
}
