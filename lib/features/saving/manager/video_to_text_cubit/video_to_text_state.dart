part of 'video_to_text_cubitt.dart';

@immutable
sealed class VideoToTextState {}

final class VideoToTextCubitInitial extends VideoToTextState {}

final class VideoToTextLoading extends VideoToTextState {}

final class VideoToTextSuccess extends VideoToTextState {}

final class VideoToTextDeleteSuccess extends VideoToTextState {}

final class VideoToTextFailing extends VideoToTextState {
  final String errMessage;
  VideoToTextFailing({required this.errMessage});
}

final class VideoToTextDeleteFailing extends VideoToTextState {
  final String errMessage;
  VideoToTextDeleteFailing({required this.errMessage});
}
