part of 'dictionary_saving_cubit.dart';

@immutable
sealed class DictionarySavingState {}

final class DictionarySavingInitial extends DictionarySavingState {}

final class DictionarySavingLoading extends DictionarySavingState {}

final class DictionarySavingSuccess extends DictionarySavingState {}

final class DictionarySavingDeleteSuccess extends DictionarySavingState {}

final class DictionarySavingFailing extends DictionarySavingState {
  final String errMessage;

  DictionarySavingFailing({required this.errMessage});
}

final class DictionarySavingDeleteFailing extends DictionarySavingState {
  final String errMessage;

  DictionarySavingDeleteFailing({required this.errMessage});
}
