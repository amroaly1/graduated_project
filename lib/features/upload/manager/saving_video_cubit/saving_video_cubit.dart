import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduate_project/features/upload/data/repo/saving_video_repo.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

part 'saving_video_state.dart';

class SavingVideoCubit extends Cubit<SavingVideoState> {
  SavingVideoCubit(this.repo) : super(SavingVideoInitial());

  final SavingVideoRepo repo;

  static SavingVideoCubit get(context) => BlocProvider.of(context);

  bool isSaved = false;

  void init() {
    isSaved = false;
  }

  Future<void> savingVideo({
    required String trsnlationid,
    required bool returnaudio,
  }) async {
    emit(SavingVideoLoadingState());
    var result = await repo.savingVideo(
        trsnlationid: trsnlationid, returnaudio: returnaudio);
    result.fold((l) => emit(SavingVideoErrorState(errMessage: l)), (r) {
      isSaved = true;
      emit(SavingVideoSuccessState());
    });
  }

  Future<void> deleteVideo({
    required String trsnlationid,
    required bool returnaudio,
  }) async {
    emit(SavingVideoLoadingState());
    Either<String, void> result;
    if (returnaudio) {
      result = await repo.deleteVideoAudio(trsnlationid: trsnlationid);
    } else {
      result = await repo.deleteVideoText(trsnlationid: trsnlationid);
    }
    result.fold((l) => emit(SavingVideoErrorState(errMessage: l)), (r) {
      isSaved = false;
      emit(SavingVideoSuccessState());
    });
  }

  void onTap({
    required String trsnlationid,
    required bool returnaudio,
  }) {
    if (isSaved) {
      deleteVideo(trsnlationid: trsnlationid, returnaudio: returnaudio);
    } else {
      savingVideo(trsnlationid: trsnlationid, returnaudio: returnaudio);
    }
  }
}
