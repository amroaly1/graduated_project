import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

part 'audio_player_state.dart';

class AudioPlayerCubit extends Cubit<AudioPlayerState> {
  AudioPlayerCubit() : super(AudioPlayerInitial());

  static AudioPlayerCubit get(context) => BlocProvider.of(context);

  late AudioPlayer player;
  Future<double> get duration async {
    Duration? du = await player.getDuration();
    return du?.inSeconds.toDouble() ?? 0;
  }

  double maxDuration = 0;

  void listenToStreamPosition(
    void Function(Duration)? onData,
  ) {
    player.onPositionChanged.listen(onData);
  }

  void seeckTo(Duration duration) async {
    await player.seek(duration);
  }

  void init({required String url}) async {
    emit(AudioPlayerInitialLoading());
    player = AudioPlayer();
    try {
      await player.setReleaseMode(ReleaseMode.stop);
      await player.setSourceUrl(url);
      maxDuration = await duration;
      listenToStreamEnd();
      emit(AudioPlayerInitialSuccess());
    } catch (e) {
      emit(
        AudioPlayerInitialFailing(
          errMessage: "Error loading audio: $e",
        ),
      );
    }
  }

  void listenToStreamEnd() {
    if (!isClosed) {
      player.onPlayerComplete.listen((event) {
        emit(AudioPlayerIsComplete());
      });
    }
  }

  void pause() async {
    await player.pause();
    emit(AudioPlayerStop());
  }

  void play() async {
    if (player.state == PlayerState.completed) {
      await player.seek(Duration.zero);
    }
    await player.resume();

    emit(AudioPlayerStop());
  }

  void skipForward() async {
    final currentPosition = await player.getCurrentPosition();
    final duration = await player.getDuration();
    final newPosition = currentPosition! + const Duration(seconds: 10);
    if (newPosition < duration!) {
      player.seek(newPosition);
    } else {
      player.seek(duration);
    }
    emit(AudioPlayerSkipForward());
  }

  void skipBackward() async {
    final currentPosition = await player.getCurrentPosition();
    final newPosition = currentPosition! - const Duration(seconds: 10);
    player.seek(newPosition > Duration.zero ? newPosition : Duration.zero);
    emit(AudioPlayerSkipBackWord());
  }

  bool isPlaying() => player.state == PlayerState.playing;

  void onTap() {
    if (isPlaying()) {
      pause();
    } else {
      play();
    }
  }
}
