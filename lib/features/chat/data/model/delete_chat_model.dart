import 'package:graduate_project/core/network/api_keys.dart';

class DeleteChatModel {
  final bool success;
  final String message;
  final int deletedTranslationId;
  final int newCount;

  DeleteChatModel(
      {required this.success,
      required this.message,
      required this.deletedTranslationId,
      required this.newCount});

  factory DeleteChatModel.fromJson(Map<String, dynamic> json) {
    return DeleteChatModel(
      success: json[ApiKeys.success],
      message: json[ApiKeys.message],
      deletedTranslationId: json[ApiKeys.deletedtranslationid],
      newCount: json[ApiKeys.newcount],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      ApiKeys.success: success,
      ApiKeys.message: message,
      ApiKeys.deletedtranslationid: deletedTranslationId,
      ApiKeys.newcount: newCount,
    };
  }
}
