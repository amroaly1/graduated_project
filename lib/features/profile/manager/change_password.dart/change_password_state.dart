part of 'change_password_cubit.dart';

@immutable
sealed class ChangePasswordState {}

final class ChangePasswordInitial extends ChangePasswordState {}

final class ChangePasswordLoading extends ChangePasswordState {}

final class ChangePasswordSuccess extends ChangePasswordState {}

final class ChangePasswordFailing extends ChangePasswordState {
  final String erroMessage;

  ChangePasswordFailing({required this.erroMessage});
}

final class ChangePasswordValidatorFailing extends ChangePasswordState {}
