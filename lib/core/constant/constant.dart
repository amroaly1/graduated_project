import 'package:graduate_project/features/dictionary/data/model/search_type_model.dart';
import 'package:graduate_project/features/saving/data/saving_category_model.dart';

List<SearchTypeModel> searchTypeList = [
  SearchTypeModel(title: "Must Match", value: 0),
  SearchTypeModel(title: "Contains", value: 1),
  SearchTypeModel(title: "Starts With", value: 2),
  SearchTypeModel(title: "Ends With", value: 3),
];

final List<SavingCategoryModel> categoriesSaving = [
  SavingCategoryModel(
    name: "All",
    items: [],
  ),
  SavingCategoryModel(
    name: 'Dictionary',
    items: [],
  ),
  SavingCategoryModel(
    name: 'Video to Audio',
    items: [],
  ),
  SavingCategoryModel(
    name: 'Video to Text',
    items: [],
  ),
  SavingCategoryModel(
    name: "Chat",
    items: [],
  ),
];
