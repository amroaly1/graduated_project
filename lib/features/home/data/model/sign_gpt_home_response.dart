import 'package:graduate_project/core/network/api_keys.dart';

class SignGPTHomeResponse {
  final int chatId;
  final String title;
  final String userPrompt;
  final String userTimestamp;
  final String assistantResponse;
  final String assistantTimestamp;

  SignGPTHomeResponse(
      {required this.chatId,
      required this.title,
      required this.userPrompt,
      required this.userTimestamp,
      required this.assistantResponse,
      required this.assistantTimestamp});

  factory SignGPTHomeResponse.fromJson(Map<String, dynamic> json) {
    return SignGPTHomeResponse(
      chatId: json[ApiKeys.chatid],
      title: json[ApiKeys.title],
      userPrompt: json[ApiKeys.userprompt],
      userTimestamp: json[ApiKeys.usertimestamp],
      assistantResponse: json[ApiKeys.assistantresponse],
      assistantTimestamp: json[ApiKeys.assistanttimestamp],
    );
  }
}
