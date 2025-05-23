import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduate_project/core/dependency_injection/di.dart';
import 'package:graduate_project/features/dictionary/data/model/resentaly_serach_model.dart';
import 'package:graduate_project/features/dictionary/data/repo/dictionary_add_favorite_repo.dart';
import 'package:graduate_project/features/dictionary/data/repo/dictionary_word_repo.dart';
import 'package:graduate_project/features/dictionary/manager/dictionary_search/dictionary_search_cubit.dart';
import 'package:graduate_project/features/dictionary/manager/sign_dictionary/sign_dictionary_cubit.dart';
import 'package:video_player/video_player.dart';

part 'show_word_state.dart';

class ShowWordCubit extends Cubit<ShowWordState> {
  ShowWordCubit(
      {required this.repo,
      required this.favoriteRepo,
      required this.isFavorite})
      : super(ShowWordInitial());

  final DictionaryAddFavoriteRepo favoriteRepo;
  final DictionaryWordRepo repo;
  List<ResentalySerachModel> resentSearch = [];

  static ShowWordCubit get(context) => BlocProvider.of(context);

  late VideoPlayerController videoController;

  late bool isFavorite;

  void initial({required String url}) {
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

  void _videoListener() {
    if (videoController.value.isInitialized &&
        videoController.value.isCompleted) {
      videoController.seekTo(Duration.zero);
      if (!isClosed) {
        emit(ShowWordInitialVideoChangePlayOrStop());
      }
    }
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

  bool isVideoPlay() => videoController.value.isPlaying;
  bool isInitilalVideoInitilal() => videoController.value.isInitialized;

  @override
  Future<void> close() async {
    videoController.removeListener(_videoListener);
    videoController.pause(); // Pause before disposing
    await videoController.dispose(); // Make sure to dispose
    return super.close();
  }

  void changeFavorite(int id) async {
    var response = await favoriteRepo.favoriteAddOrRemove(id: id);
    response.fold((ifLeft) {
      emit(ShowWordFailingToAddOrRemoveFavorite(errMessage: ifLeft));
    }, (right) {
      di<SignDictionaryCubit>().changeIsFavoriteItemInRepo(id);
      di<DictionarySearchCubit>().refreshSearch();

      isFavorite = !isFavorite;
      emit(ShowWordSuccessToAddOrRemoveFavorite());
    });
  }

  void getResentalySeacrh() async {
    var response = await repo.getResentSearch();

    response.fold((ifLeft) {
      emit(
        ShowWordFailingToAddOrRemoveFavorite(
          errMessage: ifLeft,
        ),
      );
    }, (ifRight) {
      resentSearch = ifRight;
      emit(ShowWordGetResentalySeachSuccess());
    });
  }

  void deleteResentlySearchItem(int id) async {
    var response = await repo.deleteResentSearch(id: id);
    response.fold((ifLeft) {
      emit(
        ShowWordFailingToAddOrRemoveFavorite(
          errMessage: ifLeft,
        ),
      );
    }, (ifRight) {
      getResentalySeacrh();
    });
  }
}
