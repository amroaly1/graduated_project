part of 'recentaly_chat_cubit.dart';

@immutable
sealed class RecentalyChatState {}

final class RecentalyChatInitial extends RecentalyChatState {}

final class RecentalyChatChangeCurrentIndex extends RecentalyChatState {}
