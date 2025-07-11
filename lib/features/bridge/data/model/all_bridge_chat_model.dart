import 'package:graduate_project/core/network/api_keys.dart';
import 'package:graduate_project/features/signGPT/data/model/chat_model.dart';

class AllBridgeChatModel {
  final String title;
  final List<Messages> messages;
  final String createdAt;
  final String updatedAt;

  AllBridgeChatModel(
      {required this.title,
      required this.messages,
      required this.createdAt,
      required this.updatedAt});

  factory AllBridgeChatModel.fromJson(Map<String, dynamic> json) {
    return AllBridgeChatModel(
      title: json[ApiKeys.title],
      messages: List<Messages>.from(
          json[ApiKeys.messages].map((x) => Messages.fromJson(x))),
      createdAt: json[ApiKeys.createdAt],
      updatedAt: json[ApiKeys.updatedAt],
    );
  }
}
