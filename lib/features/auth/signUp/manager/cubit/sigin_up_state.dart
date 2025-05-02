sealed class SiginUpState {}

final class SiginUpInitial extends SiginUpState {}

final class SiginUpLoading extends SiginUpState {}

final class SiginUpSuccess extends SiginUpState {}

final class SiginUpFailing extends SiginUpState {
  final String errMessage;

  SiginUpFailing({required this.errMessage});
}

final class SiginUpNotValidate extends SiginUpState {}
