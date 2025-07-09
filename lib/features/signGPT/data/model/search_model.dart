import 'package:graduate_project/core/network/api_keys.dart';
import 'package:graduate_project/features/signGPT/data/model/chat_model.dart';

class SearchModel {
  List<SearchItemModel> data;
  SearchModel({required this.data});

  factory SearchModel.fromJson(List<dynamic> json) {
    return SearchModel(
      data: json.map((e) => SearchItemModel.fromJson(e)).toList(),
    );
  }
}

class SearchItemModel {
  final int chatId;
  final String title;
  final List<Messages> matches;
  final int matchCount;
  final String updatedAt;

  SearchItemModel(
      {required this.chatId,
      required this.title,
      required this.matches,
      required this.matchCount,
      required this.updatedAt});

  factory SearchItemModel.fromJson(Map<String, dynamic> json) {
    return SearchItemModel(
      chatId: json[ApiKeys.chatid],
      title: json[ApiKeys.title],
      matches: List<Messages>.from(
          json[ApiKeys.matches].map((x) => Messages.fromJson(x))),
      matchCount: json[ApiKeys.matchCount],
      updatedAt: json[ApiKeys.updatedAt],
    );
  }
}
