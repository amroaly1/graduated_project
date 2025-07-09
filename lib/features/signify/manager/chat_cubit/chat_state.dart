part of 'translate_cubit.dart';

sealed class TranslateState {}

final class ChatInitial extends TranslateState {}

final class ChatLoading extends TranslateState {}

final class ChatSuccess extends TranslateState {}

final class ChatFailing extends TranslateState {
  final String errMessage;
  ChatFailing({required this.errMessage});
}

final class ChatAddOrRemoveFavorite extends TranslateState {}

final class ChatAddToFavoriteOrRemoveFailing extends TranslateState {
  final String errMessage;
  ChatAddToFavoriteOrRemoveFailing({required this.errMessage});
}

final class ChatAddToFavoriteOrRemoveSuccess extends TranslateState {}

final class ChatMicISDisabled extends TranslateState {}

// final class ChatMicAddText extends ChatState {}
