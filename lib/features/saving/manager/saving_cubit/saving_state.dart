part of 'saving_cubit.dart';

@immutable
sealed class SavingState {}

final class SavingInitial extends SavingState {}

final class ChangeSavingIndex extends SavingState {}
