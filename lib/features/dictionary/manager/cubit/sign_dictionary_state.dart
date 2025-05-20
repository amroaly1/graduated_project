import 'package:graduate_project/features/dictionary/data/model/map_of_character.dart';

sealed class SignDictionaryState {}

final class SignDictionaryInitial extends SignDictionaryState {}

final class SignDictionaryGetAllDataLoading extends SignDictionaryState {}

final class SignDictionaryGetAllDataSuccess extends SignDictionaryState {
  final List<MapOfCharacter> data;
  final bool canLoadMore;
  SignDictionaryGetAllDataSuccess({
    required this.data,
    required this.canLoadMore,
  });
}

final class SignDictionaryGetAllDataFailing extends SignDictionaryState {
  final String errorMessage;
  SignDictionaryGetAllDataFailing({required this.errorMessage});
}

final class SignDictionaryGetAllDataFirstFailing extends SignDictionaryState {
  final bool fromInternet;
  final String errorMessage;
  SignDictionaryGetAllDataFirstFailing({
    required this.fromInternet,
    required this.errorMessage,
  });
}
