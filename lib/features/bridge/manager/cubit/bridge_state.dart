part of 'bridge_cubit.dart';

@immutable
sealed class BridgeState {}

final class BridgeInitial extends BridgeState {}

final class AddMessageSuccess extends BridgeState {}

final class GetAllChatLoadingState extends BridgeState {}

final class GetAllChatSuccessState extends BridgeState {}

final class CloseConnect extends BridgeState {}

final class CloseConnectSuccess extends BridgeState {}

final class GetAllChatErrorState extends BridgeState {
  final String errMessage;

  GetAllChatErrorState({required this.errMessage});
}
