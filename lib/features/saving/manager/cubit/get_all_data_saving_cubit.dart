import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduate_project/features/saving/data/model/get_all_data_save_model.dart';
import 'package:graduate_project/features/saving/data/repo/get_all_data_saving_repo.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

part 'get_all_data_saving_state.dart';

class GetAllDataSavingCubit extends Cubit<GetAllDataSavingState> {
  GetAllDataSavingCubit(this.repo) : super(GetAllDataSavingInitial());

  static GetAllDataSavingCubit get(context) => BlocProvider.of(context);

  final GetAllDataSavingRepo repo;
  GetAllDataModel? getAllDataModel;

  void init() {
    if (getAllDataModel == null) {
      getAllData();
    }
  }

  void getAllData() async {
    emit(GetAllDataSavingLoading());
    var result = await repo.getAllData();
    result.fold((l) => emit(GetAllDataSavingFailing(errMessage: l)), (r) {
      getAllDataModel = r;
      emit(GetAllDataSavingSuccess());
    });
  }

  void delete() {
    getAllData();
  }
}
