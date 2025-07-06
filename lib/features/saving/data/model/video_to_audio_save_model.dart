class VideoToAudioSaveModel {
  final List<TranslationsAudio> translations;

  VideoToAudioSaveModel({required this.translations});

  factory VideoToAudioSaveModel.fromJson(Map<String, dynamic> json) {
    return VideoToAudioSaveModel(
      translations: List<TranslationsAudio>.from(
          json['translations'].map((x) => TranslationsAudio.fromJson(x))),
    );
  }
}

class TranslationsAudio {
  final String id;
  final String text;
  final String timestamp;
  final String filename;
  final String audioUrl;
  final String videoUrl;
  final String thumbnailUrl;

  TranslationsAudio(
      {required this.id,
      required this.text,
      required this.timestamp,
      required this.filename,
      required this.audioUrl,
      required this.videoUrl,
      required this.thumbnailUrl});

  factory TranslationsAudio.fromJson(Map<String, dynamic> json) {
    return TranslationsAudio(
      id: json['id'],
      text: json['text'],
      timestamp: json['timestamp'],
      filename: json['filename'],
      audioUrl: json['audio_url'],
      videoUrl: json['video_url'],
      thumbnailUrl: json['thumbnail_url'],
    );
  }
}
