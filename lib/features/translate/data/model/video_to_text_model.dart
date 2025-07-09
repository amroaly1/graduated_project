class VideoToTextModel {
  final String type;
  final String translationId;
  final String status;
  final String message;
  final int progress;
  final String text;
  final String originalFilename;

  VideoToTextModel(
      {required this.type,
      required this.translationId,
      required this.status,
      required this.message,
      required this.progress,
      required this.text,
      required this.originalFilename});

  factory VideoToTextModel.fromJson(Map<String, dynamic> json) {
    return VideoToTextModel(
      type: json['type'],
      translationId: json['translation_id'],
      status: json['status'],
      message: json['message'],
      progress: json['progress'],
      text: json['text'],
      originalFilename: json['original_filename'],
    );
  }
}
