part of 'trsanlation_saving_cubit.dart';

@immutable
sealed class TrsanlationSavingState {}

final class TrsanlationSavingInitial extends TrsanlationSavingState {}

final class TrsanlationSavingLoadingState extends TrsanlationSavingState {}

final class TrsanlationSavingSuccessState extends TrsanlationSavingState {}

final class TrsanlationSavingDeleteSuccessState
    extends TrsanlationSavingState {}

final class TrsanlationSavingErrorState extends TrsanlationSavingState {
  final String errMessage;

  TrsanlationSavingErrorState({required this.errMessage});
}

final class TrsanlationSavingDeleteErrorState extends TrsanlationSavingState {
  final String errMessage;

  TrsanlationSavingDeleteErrorState({required this.errMessage});
}
