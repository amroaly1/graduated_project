import 'package:graduate_project/core/network/api_keys.dart';
import 'package:graduate_project/features/dictionary/data/model/dictionary_item_model.dart';

class ApiReponse {
  final List<DictionaryItemModel> items;
  final int totalCount;
  final int pageNumber;
  final int pageSize;

  ApiReponse(
      {required this.items,
      required this.totalCount,
      required this.pageNumber,
      required this.pageSize});

  factory ApiReponse.fromJson(Map<String, dynamic> json) {
    return ApiReponse(
      items: (json[ApiKeys.items] as List)
          .map((i) => DictionaryItemModel.fromJson(i))
          .toList(),
      totalCount: json[ApiKeys.totalCount],
      pageNumber: json[ApiKeys.pageNumber],
      pageSize: json[ApiKeys.pageSize],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data[ApiKeys.items] = items.map((v) => v.toJson()).toList();
    data[ApiKeys.totalCount] = totalCount;
    data[ApiKeys.pageNumber] = pageNumber;
    data[ApiKeys.pageSize] = pageSize;
    return data;
  }
}
