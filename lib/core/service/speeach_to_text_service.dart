import 'package:permission_handler/permission_handler.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

abstract class SpeechToTextService {
  static Future<bool> requestPermission() async {
    var permissionStatus = await Permission.microphone.status;
    switch (permissionStatus) {
      case PermissionStatus.denied:
        permissionStatus = await Permission.microphone.request();
        return permissionStatus == PermissionStatus.granted;
      case PermissionStatus.granted:
        return true;
      case PermissionStatus.restricted:
      case PermissionStatus.limited:
      case PermissionStatus.permanentlyDenied:
      case PermissionStatus.provisional:
        return false;
    }
  }

  static final SpeechToText _speechToText = SpeechToText();

  static Future<bool> initSpeech() async {
    return _speechToText.initialize();
  }

  static Future<void> startListening(
      void Function(SpeechRecognitionResult)? onResult) async {
    await _speechToText.listen(
      onResult: onResult,
      listenFor: const Duration(seconds: 30),
      localeId: "en_En",
      // ignore: deprecated_member_use
      cancelOnError: false,
      // ignore: deprecated_member_use
      partialResults: false,
      // ignore: deprecated_member_use
      listenMode: ListenMode.confirmation,
    );
  }

  static Future<void> stopListening() async {
    await _speechToText.stop();
  }
}
