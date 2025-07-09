import 'package:graduate_project/core/network/api_keys.dart';

class ListOfChatModel {
  final List<ChatItem> chatItems;

  ListOfChatModel({required this.chatItems});

  factory ListOfChatModel.fromJson(List<dynamic> json) {
    return ListOfChatModel(
      chatItems: json.map((e) => ChatItem.fromJson(e)).toList(),
    );
  }
}

class ChatItem {
  final int chatId;
  final String title;
  final String createdAt;
  final String updatedAt;

  ChatItem(
      {required this.chatId,
      required this.title,
      required this.createdAt,
      required this.updatedAt});

  factory ChatItem.fromJson(Map<String, dynamic> json) {
    return ChatItem(
      chatId: json[ApiKeys.chatid],
      title: json[ApiKeys.title],
      createdAt: json[ApiKeys.createdAt],
      updatedAt: json[ApiKeys.updatedAt],
    );
  }
}
