sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginLoading extends LoginState {}

final class LoginSuccess extends LoginState {}

final class LoginFailing extends LoginState {
  final String errMessage;

  LoginFailing({required this.errMessage});
}

final class LoginEmailNotConfirm extends LoginState {
  final String errMessage;
  final String email;

  LoginEmailNotConfirm({required this.email, required this.errMessage});
}

final class LoginNotValidate extends LoginState {}
