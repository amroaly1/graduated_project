class VideoToAudioModel {
  final String type;
  final String translationId;
  final String status;
  final String message;
  final String audioUrl;

  VideoToAudioModel(
      {required this.type,
      required this.translationId,
      required this.status,
      required this.message,
      required this.audioUrl});

  factory VideoToAudioModel.fromJson(Map<String, dynamic> json) {
    return VideoToAudioModel(
      type: json['type'],
      translationId: json['translation_id'],
      status: json['status'],
      message: json['message'],
      audioUrl: json['audio_url'],
    );
  }
}


/*
{"type":"progress","translation_id":"7","status":"audio_ready","message":"Audio is ready for download","audio_url":"/result/7?return_audio=true"}

*/