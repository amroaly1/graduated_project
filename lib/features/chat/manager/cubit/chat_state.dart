part of 'chat_cubit.dart';

sealed class ChatState {}

final class ChatInitial extends ChatState {}

final class ChatLoading extends ChatState {}

final class ChatSuccess extends ChatState {}

final class ChatFailing extends ChatState {
  final String errMessage;
  ChatFailing({required this.errMessage});
}

final class ChatAddOrRemoveFavorite extends ChatState {}

final class ChatAddToFavoriteOrRemoveFailing extends ChatState {
  final String errMessage;
  ChatAddToFavoriteOrRemoveFailing({required this.errMessage});
}

final class ChatAddToFavoriteOrRemoveSuccess extends ChatState {}
