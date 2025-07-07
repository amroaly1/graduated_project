part of 'get_recently_saved_cubit.dart';

@immutable
sealed class GetRecentlySavedState {}

final class GetRecentlySavedInitial extends GetRecentlySavedState {}

final class GetRecentlySavedLoadingState extends GetRecentlySavedState {}

final class GetRecentlySavedSuccessState extends GetRecentlySavedState {}

final class GetRecentlySavedErrorState extends GetRecentlySavedState {
  final String errMessage;

  GetRecentlySavedErrorState({required this.errMessage});
}
