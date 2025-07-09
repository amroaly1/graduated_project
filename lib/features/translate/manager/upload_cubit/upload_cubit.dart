import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduate_project/features/translate/manager/upload_cubit/upload_state.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

class UploadCubit extends Cubit<UploadState> {
  UploadCubit() : super(UploadInitial());
  // UploadCubit._() : super(UploadInitial());

  static UploadCubit get(context) => BlocProvider.of(context);

  XFile? video;
  VideoPlayerController? controller;

  final ImagePicker picker = ImagePicker();
  void pickVideoFromGalllery() async {
    video = await picker.pickVideo(source: ImageSource.gallery);
    isUploadVideo();
  }

  void pickVideoFromCamera() async {
    video = await picker.pickVideo(source: ImageSource.camera);
    isUploadVideo();
  }

  void updateUi() {
    Future.delayed(Duration(seconds: 1), () {
      emit(UploadVideoUpdateUi());
    });
  }

  void isUploadVideo() {
    if (video != null) {
      controller = VideoPlayerController.file(File(video!.path))
        ..initialize().then((_) {
          if (!isClosed) {
            updateUi();

            emit(UploadVideoDone());
          }
        }).catchError((onError) {
          log("error : $onError");
        });
    }
  }

  String nameofvideo() {
    return video?.path.split('/').last ?? "";
  }

  String durationofVideo() {
    if (controller == null) {
      return "";
    }
    return formatDurationWithHint(controller!.value.duration);
  }

  String formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));

    return duration.inHours > 0
        ? "$hours:$minutes:$seconds"
        : "$minutes:$seconds";
  }

  String formatDurationWithHint(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');

    final hours = duration.inHours;
    final minutes = duration.inMinutes.remainder(60);
    final seconds = duration.inSeconds.remainder(60);
    final milliseconds = duration.inMilliseconds.remainder(1000);

    // If the video duration is less than 1 second, show the fraction of a second
    if (duration.inSeconds == 0) {
      return "$milliseconds milliseconds";
    } else if (hours > 0) {
      // Show hours, minutes, and seconds (hh:mm:ss) and hint "hours"
      return "${twoDigits(hours)}:${twoDigits(minutes)}:${twoDigits(seconds)} hours";
    } else if (minutes > 0) {
      // Show minutes and seconds (mm:ss) and hint "minutes"
      return "${twoDigits(minutes)}:${twoDigits(seconds)} minutes";
    } else {
      // Show seconds and hint "seconds"
      return "$seconds seconds";
    }
  }

  // String formatDurationWithHint(Duration duration) {
  //   String twoDigits(int n) => n.toString().padLeft(2, '0');

  //   final hours = duration.inHours;
  //   final minutes = duration.inMinutes.remainder(60);
  //   final seconds = duration.inSeconds.remainder(60);

  //   if (hours > 0) {
  //     // Show hours, minutes, and seconds (hh:mm:ss) and hint "hours"
  //     return "${twoDigits(hours)}:${twoDigits(minutes)}:${twoDigits(seconds)} hours";
  //   } else if (minutes > 0) {
  //     // Show minutes and seconds (mm:ss) and hint "minutes"
  //     return "${twoDigits(minutes)}:${twoDigits(seconds)} minutes";
  //   } else {
  //     // Show only seconds (ss) and hint "seconds"
  //     return "$seconds seconds";
  //   }
  // }
}
