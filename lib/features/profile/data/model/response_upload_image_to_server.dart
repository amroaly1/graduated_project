import 'package:graduate_project/core/network/api_keys.dart';

class ResponseUploadImageToServer {
  final bool isSuccess;
  final Error error;
  final Data data;

  ResponseUploadImageToServer(
      {required this.isSuccess, required this.error, required this.data});

  factory ResponseUploadImageToServer.fromJson(Map<String, dynamic> json) {
    return ResponseUploadImageToServer(
      isSuccess: json[ApiKeys.isSuccess],
      error: Error.fromJson(json[ApiKeys.error]),
      data: Data.fromJson(json[ApiKeys.data]),
    );
  }
}

class Error {
  final int code;
  final String message;

  Error({required this.code, required this.message});

  factory Error.fromJson(Map<String, dynamic> json) {
    return Error(
      code: json[ApiKeys.code],
      message: json[ApiKeys.message],
    );
  }
}

class Data {
  final String fileName;
  final String filePath;
  final String fileUrl;
  final int fileSize;
  final String contentType;

  Data(
      {required this.fileName,
      required this.filePath,
      required this.fileUrl,
      required this.fileSize,
      required this.contentType});

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      fileName: json[ApiKeys.fileName],
      filePath: json[ApiKeys.filePath],
      fileUrl: json[ApiKeys.fileUrl],
      fileSize: json[ApiKeys.fileSize],
      contentType: json[ApiKeys.contentType],
    );
  }
}
