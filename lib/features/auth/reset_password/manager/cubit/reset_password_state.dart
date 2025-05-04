part of 'reset_password_cubit.dart';

@immutable
sealed class ResetPasswordState {}

final class ResetPasswordInitial extends ResetPasswordState {}

final class ResetPasswordLoading extends ResetPasswordState {}

final class ResetPasswordSuccess extends ResetPasswordState {}

final class ResetPasswordNotValidate extends ResetPasswordState {}

final class ResetPasswordFailing extends ResetPasswordState {
  final String errMessage;

  ResetPasswordFailing({required this.errMessage});
}
