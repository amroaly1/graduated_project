part of 'forget_password_cubit.dart';

@immutable
sealed class ForgetPasswordState {}

final class ForgetPasswordInitial extends ForgetPasswordState {}

final class ForgetPasswordSendLoading extends ForgetPasswordState {}

final class ForgetPasswordSendFailing extends ForgetPasswordState {
  final String errorMessage;

  ForgetPasswordSendFailing({required this.errorMessage});
}

final class ForgetPasswordSendSuccess extends ForgetPasswordState {
  final String email;

  ForgetPasswordSendSuccess({required this.email});
}
