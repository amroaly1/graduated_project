class DictionarySavingModel {
  final int id;
  final int dictionaryEntryId;
  final String gloss;
  final String videoUrl;
  final String favoritedOn;

  DictionarySavingModel(
      {required this.id,
      required this.dictionaryEntryId,
      required this.gloss,
      required this.videoUrl,
      required this.favoritedOn});

  factory DictionarySavingModel.fromJson(Map<String, dynamic> json) {
    return DictionarySavingModel(
      id: json['id'],
      dictionaryEntryId: json['dictionaryEntryId'],
      gloss: json['gloss'],
      videoUrl: json['videoUrl'],
      favoritedOn: json['favoritedOn'],
    );
  }
}
