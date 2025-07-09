part of 'search_chat_cubit.dart';

@immutable
sealed class SearchChatState {}

final class SearchChatInitial extends SearchChatState {}

final class SearchChatLoading extends SearchChatState {}

final class SearchChatSuccess extends SearchChatState {
  final SearchModel data;

  SearchChatSuccess({required this.data});
}

final class SearchChatError extends SearchChatState {
  final String errMessage;

  SearchChatError({required this.errMessage});
}
