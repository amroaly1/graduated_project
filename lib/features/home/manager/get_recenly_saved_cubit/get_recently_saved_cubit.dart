import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduate_project/features/home/data/model/recentaly_save_model.dart';
import 'package:graduate_project/features/home/data/repo/get_recentaly_saved.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

part 'get_recently_saved_state.dart';

class GetRecentlySavedCubit extends Cubit<GetRecentlySavedState> {
  GetRecentlySavedCubit(this.repo) : super(GetRecentlySavedInitial());

  static GetRecentlySavedCubit get(context) => BlocProvider.of(context);

  final GetRecentalySavedRepo repo;

  late RecentlySaveModel recentlySaveModel;

  Future<void> getRecentalySaved() async {
    emit(GetRecentlySavedLoadingState());
    var result = await repo.getRecentalySaved();
    result.fold((l) {
      emit(GetRecentlySavedErrorState(
        errMessage: l,
      ));
    }, (r) {
      recentlySaveModel = r;
      emit(GetRecentlySavedSuccessState());
    });
  }
}
