class TranslationSavingModel {
  final List<TranslationsTranslate> translations;
  final int count;

  TranslationSavingModel({required this.translations, required this.count});

  factory TranslationSavingModel.fromJson(Map<String, dynamic> json) {
    return TranslationSavingModel(
      translations: json['translations'] != null
          ? List<TranslationsTranslate>.from(json['translations']
              .map((x) => TranslationsTranslate.fromJson(x)))
          : [],
      count: json['count'],
    );
  }
}

class TranslationsTranslate {
  final int translationId;
  final String originalText;
  final List<String>? words;
  final String? img;
  final String? savedAt;
  final String? thumbnailUrl;
  final String? audioUrl;
  final bool? hasAudio;
  final bool? hasThumbnail;

  TranslationsTranslate(
      {required this.translationId,
      required this.originalText,
      required this.words,
      required this.img,
      required this.savedAt,
      required this.thumbnailUrl,
      required this.audioUrl,
      required this.hasAudio,
      required this.hasThumbnail});

  factory TranslationsTranslate.fromJson(Map<String, dynamic> json) {
    return TranslationsTranslate(
      translationId: json['translation_id'],
      originalText: json['original_text'],
      words: json['words'] != null ? List<String>.from(json['words']) : null,
      img: json['img'],
      savedAt: json['saved_at'],
      thumbnailUrl: json['thumbnail_url'],
      audioUrl: json['audio_url'],
      hasAudio: json['has_audio'],
      hasThumbnail: json['has_thumbnail'],
    );
  }
}
