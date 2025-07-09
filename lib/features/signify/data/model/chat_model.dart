import 'package:graduate_project/core/network/api_keys.dart';

class ChatModel {
  final String img;
  final List<String> words;
  final double processingTime;
  final int wordCount;
  final String originalText;
  bool isSaved;
  int? translationId;

  ChatModel({
    required this.img,
    required this.words,
    required this.processingTime,
    required this.wordCount,
    required this.originalText,
    required this.isSaved,
    required this.translationId,
  });

  factory ChatModel.fromJson(Map<String, dynamic> json) {
    return ChatModel(
      img: json[ApiKeys.img],
      words: json[ApiKeys.words].cast<String>(),
      processingTime: json[ApiKeys.processingtime],
      wordCount: json[ApiKeys.wordcount],
      originalText: json[ApiKeys.originaltext],
      isSaved: json[ApiKeys.isSaved],
      translationId: json[ApiKeys.translationId],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      ApiKeys.img: img,
      ApiKeys.words: words,
      ApiKeys.processingtime: processingTime,
      ApiKeys.wordcount: wordCount,
      ApiKeys.originaltext: originalText,
      ApiKeys.isSaved: isSaved,
      ApiKeys.translationId: translationId,
    };
  }
}
