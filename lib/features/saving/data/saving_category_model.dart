class SavingCategoryModel {
  final String name;
  final List<SavingCategoryItem> items;
  SavingCategoryModel({
    required this.name,
    required this.items,
  });
}

class SavingCategoryItem {
  final String title;
  final String subtitl1;
  final String subtitl2;
  final String image;
  SavingCategoryItem({
    required this.title,
    required this.subtitl1,
    required this.subtitl2,
    required this.image,
  });
}
