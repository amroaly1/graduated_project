import 'dart:convert';
import 'dart:async';
import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduate_project/features/upload/data/model/video_to_audio_model.dart';
import 'package:graduate_project/features/upload/data/model/video_to_text_model.dart';
import 'package:graduate_project/features/upload/data/repo/upload_video_repo.dart';
import 'package:image_picker/image_picker.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';
import 'package:web_socket_channel/io.dart';

part 'upload_video_state.dart';

class UploadVideoCubit extends Cubit<UploadVideoState> {
  UploadVideoCubit(this.uploadVideoRepo) : super(UploadVideoInitial());

  static UploadVideoCubit get(context) => BlocProvider.of(context);

  final UploadVideoRepo uploadVideoRepo;
  IOWebSocketChannel? _channel;
  StreamSubscription? _subscription;
  bool isAudio = false;

  Future<void> uploadVideo({
    required XFile video,
    required bool returnaudio,
  }) async {
    isAudio = returnaudio;

    // Close previous connection if exists
    await _closeConnection();

    log("Connecting to: wss://9d47-34-125-181-156.ngrok-free.app/ws/${uploadVideoRepo.getUserId()}");

    emit(UploadVideoLoadingState());

    try {
      // Open new socket connection
      _channel = IOWebSocketChannel.connect(
        'wss://9d47-34-125-181-156.ngrok-free.app/ws/${uploadVideoRepo.getUserId()}',
      );

      // Start listening to the socket
      _listenToSocket();

      // Upload the video
      var response = await uploadVideoRepo.uploadVideo(
        image: video,
        returnaudio: returnaudio,
      );

      response.fold(
        (l) => emit(UploadVideoErrorState(errMessage: l)),
        (r) {}, // Success is handled by the socket listener
      );
    } catch (e) {
      emit(UploadVideoErrorState(errMessage: e.toString()));
    }
  }

  void _listenToSocket() {
    _subscription = _channel?.stream.listen(
      (event) {
        log("Socket Data: $event");

        try {
          final data = jsonDecode(event);

          if (isAudio) {
            final audioModel = VideoToAudioModel.fromJson(data);
            if (audioModel.status == "audio_ready") {
              emit(UploadVideoSuccessState(
                isAudio: isAudio,
                videoToAudioModel: audioModel,
              ));
              _closeConnection(); // Close after success
            }
          } else {
            final textModel = VideoToTextModel.fromJson(data);
            if (textModel.status == "completed") {
              emit(UploadVideoSuccessState(
                isAudio: isAudio,
                videoToTextModel: textModel,
              ));
              _closeConnection(); // Close after success
            }
          }
        } catch (e) {
          log("Invalid socket data: $e");
        }
      },
      onError: (error) {
        log('WebSocket error: $error');
        emit(UploadVideoErrorState(errMessage: error.toString()));
        _closeConnection();
      },
      onDone: () {
        log('WebSocket closed');
        _closeConnection();
      },
    );
  }

  Future<void> _closeConnection() async {
    await _subscription?.cancel();
    _subscription = null;

    await _channel?.sink.close();
    _channel = null;
  }

  @override
  Future<void> close() async {
    await _closeConnection();
    return super.close();
  }
}
