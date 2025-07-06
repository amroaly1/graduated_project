import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduate_project/core/dependency_injection/di.dart';
import 'package:graduate_project/features/saving/data/model/video_to_text_save_model.dart';
import 'package:graduate_project/features/saving/data/repo/video_to_text_save_repo.dart';
import 'package:graduate_project/features/upload/data/repo/saving_video_repo.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

part 'video_to_text_state.dart';

class VideoToTextCubit extends Cubit<VideoToTextState> {
  VideoToTextCubit(this.videoToTextSaveRepo) : super(VideoToTextCubitInitial());

  static VideoToTextCubit get(context) => BlocProvider.of(context);

  final VideoToTextSaveRepo videoToTextSaveRepo;

  VideoToTextSaveModel? videoToTextSaveModel;

  void init() {
    if (videoToTextSaveModel == null) {
      getVideoToTextSave();
    }
  }

  void getVideoToTextSave() async {
    emit(VideoToTextLoading());
    var result = await videoToTextSaveRepo.getVideoToTextSave();
    result.fold((l) => emit(VideoToTextFailing(errMessage: l)), (r) {
      videoToTextSaveModel = r;
      emit(VideoToTextSuccess());
    });
  }

  void deleteItem({required String trsnlationid}) async {
    var result =
        await di<SavingVideoRepo>().deleteVideoText(trsnlationid: trsnlationid);

    result.fold((l) => emit(VideoToTextDeleteFailing(errMessage: l)), (r) {
      videoToTextSaveModel?.translations.removeWhere(
        (element) => element.id == trsnlationid,
      );
      emit(VideoToTextDeleteSuccess());
    });
  }
}
