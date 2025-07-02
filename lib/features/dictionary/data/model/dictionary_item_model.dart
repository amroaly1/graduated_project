import 'package:graduate_project/core/network/api_keys.dart';

class DictionaryItemModel {
  final int id;
  final String gloss;
  final String videoUrl;
  final int searchCount;
  final String source;
  bool isFavorite;
  bool isCharacters = false;
  final String createdOn;
  final String? lastModifiedOn;

  DictionaryItemModel(
      {required this.id,
      required this.gloss,
      required this.videoUrl,
      required this.searchCount,
      required this.isFavorite,
      required this.createdOn,
      required this.source,
      this.lastModifiedOn});

  DictionaryItemModel.isCharacters(
      {this.id = 0,
      required this.gloss,
      this.videoUrl = "",
      this.searchCount = 0,
      this.isFavorite = false,
      this.createdOn = "",
      this.source = "",
      this.lastModifiedOn})
      : isCharacters = true;

  factory DictionaryItemModel.fromJson(Map<String, dynamic> json) {
    return DictionaryItemModel(
        id: json[ApiKeys.id],
        gloss: json[ApiKeys.gloss],
        videoUrl: json[ApiKeys.videoUrl],
        searchCount: json[ApiKeys.searchCount],
        isFavorite: json[ApiKeys.isFavorite],
        createdOn: json[ApiKeys.createdOn],
        source: json[ApiKeys.source],
        lastModifiedOn: json[ApiKeys.lastModifiedOn]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data[ApiKeys.id] = id;
    data[ApiKeys.gloss] = gloss;
    data[ApiKeys.videoUrl] = videoUrl;
    data[ApiKeys.searchCount] = searchCount;
    data[ApiKeys.isFavorite] = isFavorite;
    data[ApiKeys.createdOn] = createdOn;
    data[ApiKeys.lastModifiedOn] = lastModifiedOn;
    return data;
  }
}
