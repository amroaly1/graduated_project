class BridgeResponseModel {
  final String type;
  final String from;
  final String deviceType;
  final String message;
  final String originalFilename;
  final String timestamp;

  BridgeResponseModel(
      {required this.type,
      required this.from,
      required this.deviceType,
      required this.message,
      required this.originalFilename,
      required this.timestamp});

  factory BridgeResponseModel.fromJson(Map<String, dynamic> json) {
    return BridgeResponseModel(
      type: json['type'],
      from: json['from'],
      deviceType: json['device_type'],
      message: json['message'],
      originalFilename: json['original_filename'],
      timestamp: json['timestamp'],
    );
  }
}
