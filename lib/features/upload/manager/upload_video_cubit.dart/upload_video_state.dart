part of 'upload_video_cubit.dart';

@immutable
sealed class UploadVideoState {}

final class UploadVideoInitial extends UploadVideoState {}

final class UploadVideoLoadingState extends UploadVideoState {}

final class UploadVideoSuccessState extends UploadVideoState {
  final bool isAudio;
  final VideoToTextModel? videoToTextModel;
  final VideoToAudioModel? videoToAudioModel;
  UploadVideoSuccessState(
      {required this.isAudio, this.videoToAudioModel, this.videoToTextModel});
}

final class UploadVideoErrorState extends UploadVideoState {
  final String errMessage;
  UploadVideoErrorState({required this.errMessage});
}
