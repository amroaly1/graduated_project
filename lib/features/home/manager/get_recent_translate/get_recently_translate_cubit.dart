import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduate_project/features/home/data/model/recenlty_transalte_model.dart';
import 'package:graduate_project/features/home/data/repo/get_recently_translate.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

part 'get_recently_translate_state.dart';

class GetRecentlyTranslateCubit extends Cubit<GetRecentlyTranslateState> {
  GetRecentlyTranslateCubit(this.repo) : super(GetRecentlyTranslateInitial());

  static GetRecentlyTranslateCubit get(context) => BlocProvider.of(context);

  final GetRecentlyTranslateRepo repo;

  late RecenltyTransalteModel recentlyTranslateModel;
  Future<void> getRecentlyTranslate() async {
    emit(GetRecentlyTranslateLoading());
    var result = await repo.getRecentalySaved();
    result.fold((l) {
      emit(GetRecentlyTranslateError(errMessage: l));
    }, (r) {
      recentlyTranslateModel = r;
      emit(GetRecentlyTranslateSuccess());
    });
  }
}
