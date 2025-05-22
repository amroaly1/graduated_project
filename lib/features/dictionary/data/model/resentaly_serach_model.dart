/*

{
    "id": 0,
    "searchText": "string",
    "matchedResult": {
      "id": 0,
      "gloss": "string",
      "videoUrl": "string",
      "searchCount": 0,
      "isFavorite": true,
      "createdOn": "2025-05-22T09:59:42.660Z",
      "lastModifiedOn": "2025-05-22T09:59:42.660Z"
    },
    "searchDate": "2025-05-22T09:59:42.660Z"
  }

*/

import 'package:graduate_project/core/network/api_keys.dart';
import 'package:graduate_project/features/dictionary/data/model/dictionary_item_model.dart';

class ResentalySerachModel {
  final int id;
  final String searchText;
  final DictionaryItemModel matchedResult;
  final String searchDate;

  ResentalySerachModel({
    required this.id,
    required this.searchText,
    required this.matchedResult,
    required this.searchDate,
  });

  factory ResentalySerachModel.fromJson(Map<String, dynamic> json) {
    return ResentalySerachModel(
      id: json[ApiKeys.id],
      searchText: json[ApiKeys.searchText],
      matchedResult: DictionaryItemModel.fromJson(json[ApiKeys.matchedResult]),
      searchDate: json[ApiKeys.searchDate],
    );
  }
}
