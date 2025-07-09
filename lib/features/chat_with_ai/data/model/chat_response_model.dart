import 'package:graduate_project/core/network/api_keys.dart';

class ChatResponse {
  /*
  {
  "chat_id": 3,
  "user_id": 0,
  "query": "hello",
  "response": "Hello! How can I assist you today? Are you interested in learning about sign language linguistics, Deaf culture, or perhaps something else related to these topics?",
  "timestamp": "2025-07-09T13:38:00.048885",
  "title": null
}

  */
  final int chatId;
  final int userId;
  final String query;
  final String response;
  final String timestamp;
  final String? title;

  ChatResponse(
      {required this.chatId,
      required this.userId,
      required this.query,
      required this.response,
      required this.timestamp,
      required this.title});

  factory ChatResponse.fromJson(Map<String, dynamic> json) {
    return ChatResponse(
      chatId: json[ApiKeys.chatid],
      userId: json[ApiKeys.userid],
      query: json[ApiKeys.query],
      response: json[ApiKeys.response],
      timestamp: json[ApiKeys.timestamp],
      title: json[ApiKeys.title],
    );
  }
}
