part of 'recentaly_chat_cubit.dart';

@immutable
sealed class RecentalyChatState {}

final class RecentalyChatInitial extends RecentalyChatState {}

final class RecentalyChatChangeCurrentIndex extends RecentalyChatState {}

final class RecentlyChatLoadingState extends RecentalyChatState {}

final class RecentlyChatSuccessState extends RecentalyChatState {}

final class RecentlyChatErrorState extends RecentalyChatState {
  final String errMessage;

  RecentlyChatErrorState({required this.errMessage});
}
