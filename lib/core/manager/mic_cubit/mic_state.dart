part of 'mic_cubit.dart';

@immutable
sealed class MicState {}

final class MicInitial extends MicState {}

final class MicISDisabled extends MicState {}

final class MicAddText extends MicState {}
