part of 'show_word_cubit.dart';

sealed class ShowWordState {}

final class ShowWordInitial extends ShowWordState {}

final class ShowWordInitialVideoInitilal extends ShowWordState {}

final class ShowWordInitialVideoChangePlayOrStop extends ShowWordState {}

final class ShowWordFailingToAddOrRemoveFavorite extends ShowWordState {
  final String errMessage;
  ShowWordFailingToAddOrRemoveFavorite({required this.errMessage});
}

final class ShowWordSuccessToAddOrRemoveFavorite extends ShowWordState {}
