part of 'saving_video_cubit.dart';

@immutable
sealed class SavingVideoState {}

final class SavingVideoInitial extends SavingVideoState {}

final class SavingVideoLoadingState extends SavingVideoState {}

final class SavingVideoSuccessState extends SavingVideoState {}

final class SavingVideoErrorState extends SavingVideoState {
  final String errMessage;

  SavingVideoErrorState({required this.errMessage});
}
