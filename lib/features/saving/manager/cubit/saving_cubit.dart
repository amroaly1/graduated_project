import 'package:flutter_bloc/flutter_bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

part 'saving_state.dart';

class SavingCubit extends Cubit<SavingState> {
  SavingCubit() : super(SavingInitial());

  static SavingCubit get(context) => BlocProvider.of(context);

  int currentSavingIndex = 0;

  void changeSavingIndex({required int index}) {
    currentSavingIndex = index;
    emit(ChangeSavingIndex());
  }
}
