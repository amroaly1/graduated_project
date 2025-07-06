import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduate_project/core/dependency_injection/di.dart';
import 'package:graduate_project/features/saving/data/model/video_to_audio_save_model.dart';
import 'package:graduate_project/features/saving/data/repo/video_to_audio_save_repo.dart';
import 'package:graduate_project/features/upload/data/repo/saving_video_repo.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

part 'video_to_audio_save_state.dart';

class VideoToAudioSaveCubit extends Cubit<VideoToAudioSaveState> {
  VideoToAudioSaveCubit(this.rep) : super(VideoToAudioSaveInitial());

  static VideoToAudioSaveCubit get(context) => BlocProvider.of(context);

  VideoToAudioSaveModel? videoToAudioSaveModel;
  final VideoToAudioSaveRepo rep;

  void init() {
    if (videoToAudioSaveModel == null) {
      getVideoToAudioSave();
    }
  }

  void getVideoToAudioSave() async {
    emit(VideoToAudioSaveLoading());
    var result = await rep.getVideoToAudioSave();
    result.fold((l) => emit(VideoToAudioSaveFailing(errMessage: l)), (r) {
      videoToAudioSaveModel = r;
      emit(VideoToAudioSaveSuccess());
    });
  }

  void deleteItem({required String trsnlationid}) async {
    var result = await di<SavingVideoRepo>()
        .deleteVideoAudio(trsnlationid: trsnlationid);

    result.fold((l) => emit(VideoToAudioSaveDeleteFailing(errMessage: l)), (r) {
      videoToAudioSaveModel?.translations.removeWhere(
        (element) => element.id == trsnlationid,
      );
      emit(VideoToAudioSaveDeleteSuccess());
    });
  }
}
