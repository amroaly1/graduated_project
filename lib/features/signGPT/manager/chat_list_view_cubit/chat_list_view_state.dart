part of 'chat_list_view_cubit.dart';

@immutable
sealed class ChatListViewState {}

final class ChatListViewInitial extends ChatListViewState {}

final class ChatListViewCreateNewChat extends ChatListViewState {}

final class ChatListViewLoading extends ChatListViewState {}

final class ChatListViewSuccess extends ChatListViewState {}

final class ChatListViewAddItemLoading extends ChatListViewState {}

final class ChatListViewAddItemSuccess extends ChatListViewState {}

final class ChatListViewFailing extends ChatListViewState {
  final String errMessage;

  ChatListViewFailing({required this.errMessage});
}

final class ChatListViewSearchSccess extends ChatListViewState {
  final int index;

  ChatListViewSearchSccess({required this.index});
}

final class ChatListViewAddItemFailing extends ChatListViewState {
  final String errMessage;

  ChatListViewAddItemFailing({required this.errMessage});
}
