class VideoToTextSaveModel {
  final List<TranslationsText> translations;

  VideoToTextSaveModel({required this.translations});

  factory VideoToTextSaveModel.fromJson(Map<String, dynamic> json) {
    return VideoToTextSaveModel(
      translations: List<TranslationsText>.from(
          json['translations'].map((x) => TranslationsText.fromJson(x))),
    );
  }
}

class TranslationsText {
  final String id;
  final String text;
  final String timestamp;
  final String filename;
  final String videoUrl;
  final String thumbnailUrl;

  TranslationsText(
      {required this.id,
      required this.text,
      required this.timestamp,
      required this.filename,
      required this.videoUrl,
      required this.thumbnailUrl});

  factory TranslationsText.fromJson(Map<String, dynamic> json) {
    return TranslationsText(
      id: json['id'],
      text: json['text'],
      timestamp: json['timestamp'],
      filename: json['filename'],
      videoUrl: json['video_url'],
      thumbnailUrl: json['thumbnail_url'],
    );
  }
}
