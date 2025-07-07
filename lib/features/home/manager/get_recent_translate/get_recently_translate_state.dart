part of 'get_recently_translate_cubit.dart';

@immutable
sealed class GetRecentlyTranslateState {}

final class GetRecentlyTranslateInitial extends GetRecentlyTranslateState {}

final class GetRecentlyTranslateLoading extends GetRecentlyTranslateState {}

final class GetRecentlyTranslateSuccess extends GetRecentlyTranslateState {}

final class GetRecentlyTranslateError extends GetRecentlyTranslateState {
  final String errMessage;

  GetRecentlyTranslateError({required this.errMessage});
}
