part of 'confirm_email_cubit.dart';

@immutable
sealed class ConfirmEmailState {}

final class ConfirmEmailInitial extends ConfirmEmailState {}

final class ConfirmEmailChangeCount extends ConfirmEmailState {}

final class ConfirmEmailEndFirstCountCount extends ConfirmEmailState {}

final class ConfirmEmailEndSecondCountCount extends ConfirmEmailState {}

final class SendConfirmEmailFirstTimeFailing extends ConfirmEmailState {
  final String errorMessage;

  SendConfirmEmailFirstTimeFailing({required this.errorMessage});
}

final class SendConfirmEmailFirstTimeFailingNoInternet
    extends ConfirmEmailState {
  final String errorMessage;

  SendConfirmEmailFirstTimeFailingNoInternet({required this.errorMessage});
}

final class SendConfirmEmailFailing extends ConfirmEmailState {
  final String errorMessage;

  SendConfirmEmailFailing({required this.errorMessage});
}

final class ConfirmEmailFailing extends ConfirmEmailState {
  final String errorMessage;

  ConfirmEmailFailing({required this.errorMessage});
}

final class ConfirmEmailNoValidate extends ConfirmEmailState {
  final String errorMessage;

  ConfirmEmailNoValidate({required this.errorMessage});
}

final class ConfirmEmailSuccess extends ConfirmEmailState {
  ConfirmEmailSuccess();
}

final class ConfirmEmailLoading extends ConfirmEmailState {
  ConfirmEmailLoading();
}
