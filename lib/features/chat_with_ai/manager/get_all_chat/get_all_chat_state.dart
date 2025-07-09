part of 'get_all_chat_cubit.dart';

@immutable
sealed class GetAllChatState {}

final class GetAllChatInitial extends GetAllChatState {}

final class GetAllChatDeleteOnLoading extends GetAllChatState {}

final class GetAllChatDeleteOnSuccess extends GetAllChatState {}

final class GetAllChatDeleteOnFailing extends GetAllChatState {
  final String errMessage;

  GetAllChatDeleteOnFailing({required this.errMessage});
}

final class GetAllChatLoading extends GetAllChatState {}

final class GetAllChatSuccess extends GetAllChatState {}

final class GetAllChatFailing extends GetAllChatState {
  final String errMessage;

  GetAllChatFailing({required this.errMessage});
}
