import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduate_project/features/dictionary/data/model/dictionary_item_model.dart';
import 'package:graduate_project/features/home/data/repo/home_dictionar_repo.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';
import 'package:video_player/video_player.dart';

part 'home_dictionary_state.dart';

class HomeDictionaryCubit extends Cubit<HomeDictionaryState> {
  HomeDictionaryCubit(this.repo) : super(HomeDictionaryInitial());

  final HomeDictionarRepo repo;

  static HomeDictionaryCubit get(context) => BlocProvider.of(context);

  List<DictionaryItemModel> list = [];
  int currentIndex = 0;

  late VideoPlayerController videoController;

  void _videoListener() {
    if (videoController.value.isInitialized &&
        videoController.value.isCompleted) {
      videoController.seekTo(Duration.zero);
      if (!isClosed) {
        // emit(ShowWordInitialVideoChangePlayOrStop());
      }
    }
  }

  void init() async {
    emit(GetDataLoading());

    var response = await repo.getRandomDictionaryWord();

    response.fold((ifLeft) {
      log("Failing  : $ifLeft");
      emit(GetDataFailing(errMessage: ifLeft));
    }, (ifRight) {
      list = ifRight;
      log(list.toString());
      log("getData");
      initialVideo(url: list[currentIndex].videoUrl);
    });
  }

  void changeCurrentIndex(int index) {
    currentIndex = index;
    initialVideo(url: list[currentIndex].videoUrl);
  }

  void initialVideo({required String url}) {
    log("Url : $url");

    videoController = VideoPlayerController.networkUrl(Uri.parse(url))
      ..addListener(_videoListener)
      ..initialize().then((_) {
        if (!isClosed) {
          videoController.play();

          emit(ShowWordInitialVideoInitilal());
        }
      }).catchError((error) {
        log("Video initialization error: $error");
        // Optionally emit an error state here
      });
  }

  void changePlayOrStop() {
    if (videoController.value.isPlaying) {
      videoController.pause();
    } else {
      videoController.play();
    }
    if (!isClosed) {
      emit(ShowWordInitialVideoChangePlayOrStop());
    }
  }

  bool isVideoPlay() =>
      videoController.value.isPlaying && !videoController.value.isCompleted;
  bool isInitilalVideoInitilal() => videoController.value.isInitialized;

  @override
  Future<void> close() async {
    videoController.removeListener(_videoListener);
    videoController.pause(); // Pause before disposing
    await videoController.dispose(); // Make sure to dispose
    return super.close();
  }
}
