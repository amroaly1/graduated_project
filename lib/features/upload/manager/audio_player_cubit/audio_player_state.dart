part of 'audio_player_cubit.dart';

@immutable
sealed class AudioPlayerState {}

final class AudioPlayerInitial extends AudioPlayerState {}

final class AudioPlayerInitialLoading extends AudioPlayerState {}

final class AudioPlayerInitialSuccess extends AudioPlayerState {}

final class AudioPlayerInitialFailing extends AudioPlayerState {
  final String errMessage;

  AudioPlayerInitialFailing({required this.errMessage});
}

final class AudioPlayerStop extends AudioPlayerState {}

final class AudioPlayerPlay extends AudioPlayerState {}

final class AudioPlayerSkipForward extends AudioPlayerState {}

final class AudioPlayerSkipBackWord extends AudioPlayerState {}

final class AudioPlayerIsComplete extends AudioPlayerState {}
