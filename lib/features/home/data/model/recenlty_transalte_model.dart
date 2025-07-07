class RecenltyTransalteModel {
  final List<Translations> translations;
  final int count;
  final Sources sources;

  RecenltyTransalteModel(
      {required this.translations, required this.count, required this.sources});

  factory RecenltyTransalteModel.fromJson(Map<String, dynamic> json) {
    return RecenltyTransalteModel(
      translations: List<Translations>.from(
          json['translations'].map((x) => Translations.fromJson(x))),
      count: json['count'],
      sources: Sources.fromJson(json['sources']),
    );
  }
}

class Translations {
  String? id;
  String? text;
  String? timestamp;
  String? filename;
  String? audioUrl;
  String? videoUrl;
  String? thumbnailUrl;
  String? sourceType;
  String? translationType;
  String? translationId;
  String? originalText;
  List<String>? words;
  String? img;
  String? savedAt;
  bool? hasAudio;
  bool? hasThumbnail;
  int? dictionaryEntryId;
  String? gloss;
  String? videoUrld;
  String? favoritedOn;

  Translations(
      {this.id,
      this.text,
      this.timestamp,
      this.filename,
      this.audioUrl,
      this.videoUrl,
      this.thumbnailUrl,
      this.sourceType,
      this.translationType,
      this.translationId,
      this.originalText,
      this.words,
      this.img,
      this.savedAt,
      this.hasAudio,
      this.hasThumbnail,
      this.dictionaryEntryId,
      this.gloss,
      this.videoUrld,
      this.favoritedOn});

  Translations.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString();
    text = json['text'];
    timestamp = json['timestamp'];
    filename = json['filename'];
    audioUrl = json['audio_url'];
    videoUrl = json['video_url'];
    thumbnailUrl = json['thumbnail_url'];
    sourceType = json['source_type'];
    translationType = json['translation_type'];
    translationId = json['translation_id'].toString();
    originalText = json['original_text'];
    words = json['words']?.cast<String>();
    img = json['img'];
    savedAt = json['saved_at'];
    hasAudio = json['has_audio'];
    hasThumbnail = json['has_thumbnail'];
    dictionaryEntryId = json['dictionaryEntryId'];
    gloss = json['gloss'];
    videoUrld = json['videoUrl'];
    favoritedOn = json['favoritedOn'];
  }
}

class Sources {
  int? videoToText;
  int? textToVideo;

  Sources({this.videoToText, this.textToVideo});

  Sources.fromJson(Map<String, dynamic> json) {
    videoToText = json['video_to_text'];
    textToVideo = json['text_to_video'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['video_to_text'] = this.videoToText;
    data['text_to_video'] = this.textToVideo;
    return data;
  }
}
