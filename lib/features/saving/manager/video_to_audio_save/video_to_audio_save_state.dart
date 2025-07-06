part of 'video_to_audio_save_cubit.dart';

@immutable
sealed class VideoToAudioSaveState {}

final class VideoToAudioSaveInitial extends VideoToAudioSaveState {}

final class VideoToAudioSaveLoading extends VideoToAudioSaveState {}

final class VideoToAudioSaveSuccess extends VideoToAudioSaveState {}

final class VideoToAudioSaveDeleteSuccess extends VideoToAudioSaveState {}

final class VideoToAudioSaveFailing extends VideoToAudioSaveState {
  final String errMessage;
  VideoToAudioSaveFailing({required this.errMessage});
}

final class VideoToAudioSaveDeleteFailing extends VideoToAudioSaveState {
  final String errMessage;
  VideoToAudioSaveDeleteFailing({required this.errMessage});
}
