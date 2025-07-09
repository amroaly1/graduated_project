import 'package:flutter_bloc/flutter_bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

part 'video_to_audio_state.dart';

class VideoToAudioCubit extends Cubit<VideoToAudioState> {
  VideoToAudioCubit() : super(VideoToAudioInitial());
}
