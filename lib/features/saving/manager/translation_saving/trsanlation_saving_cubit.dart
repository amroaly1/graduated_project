import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduate_project/core/dependency_injection/di.dart';
import 'package:graduate_project/features/chat/data/repo/chat_repo.dart';
import 'package:graduate_project/features/saving/data/model/translation_saving_model.dart';
import 'package:graduate_project/features/saving/data/repo/trasnlation_saving_repo.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

part 'trsanlation_saving_state.dart';

class TrsanlationSavingCubit extends Cubit<TrsanlationSavingState> {
  TrsanlationSavingCubit(this.repo) : super(TrsanlationSavingInitial());

  static TrsanlationSavingCubit get(context) => BlocProvider.of(context);

  final TrasnlationSavingRepo repo;

  TranslationSavingModel? translationSavingModel;

  void init() {
    if (translationSavingModel == null) {
      getSavingTranslation();
    }
  }

  void getSavingTranslation() async {
    emit(TrsanlationSavingLoadingState());
    var result = await repo.getSavingTranslation();
    result.fold((l) => emit(TrsanlationSavingErrorState(errMessage: l)), (r) {
      translationSavingModel = r;
      emit(TrsanlationSavingSuccessState());
    });
  }

  void deleteItem({required int trsnlationid}) async {
    var result = await di<ChatRepo>().delete(translationid: trsnlationid);
    result.fold((l) => emit(TrsanlationSavingDeleteErrorState(errMessage: l)),
        (r) {
      translationSavingModel?.translations
          .removeWhere((element) => element.translationId == trsnlationid);
      emit(TrsanlationSavingDeleteSuccessState());
    });
  }
}
