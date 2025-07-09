import 'package:graduate_project/core/network/api_keys.dart';

class ChatWithAiModel {
  final int chatId;
  final int userId;
  final String title;
  final List<Messages> messages;
  final String createdAt;
  final String updatedAt;

  ChatWithAiModel({
    required this.chatId,
    required this.userId,
    required this.title,
    required this.messages,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ChatWithAiModel.fromJson(Map<String, dynamic> json) {
    return ChatWithAiModel(
      chatId: json[ApiKeys.chatid],
      userId: json[ApiKeys.userid],
      title: json[ApiKeys.title],
      messages: List<Messages>.from(
          json[ApiKeys.messages].map((x) => Messages.fromJson(x))),
      createdAt: json[ApiKeys.createdAt],
      updatedAt: json[ApiKeys.updatedAt],
    );
  }
}

class Messages {
  final String role;
  final String content;
  final String timestamp;

  Messages(
      {required this.role, required this.content, required this.timestamp});

  factory Messages.fromJson(Map<String, dynamic> json) {
    return Messages(
      role: json[ApiKeys.role],
      content: json[ApiKeys.content],
      timestamp: json[ApiKeys.timestamp],
    );
  }
}
