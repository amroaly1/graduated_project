import 'package:graduate_project/core/network/api_keys.dart';

class SaveChatModel {
  final int translationId;
  final String message;
  final String savedAt;

  SaveChatModel(
      {required this.translationId,
      required this.message,
      required this.savedAt});

  factory SaveChatModel.fromJson(Map<String, dynamic> json) {
    return SaveChatModel(
      translationId: json[ApiKeys.translationId],
      message: json[ApiKeys.message],
      savedAt: json[ApiKeys.savedAt],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      ApiKeys.translationId: translationId,
      ApiKeys.message: message,
      ApiKeys.savedAt: savedAt,
    };
  }
}
