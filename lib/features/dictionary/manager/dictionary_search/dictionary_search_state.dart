part of 'dictionary_search_cubit.dart';

sealed class DictionarySearchState {}

final class DictionarySearchInitial extends DictionarySearchState {}

final class DictionarySearchError extends DictionarySearchState {
  final String errMessage;
  final bool isFromInternet;
  DictionarySearchError({
    required this.errMessage,
    required this.isFromInternet,
  });
}

final class DictionarySearchSuccess extends DictionarySearchState {
  final List<DictionaryItemModel> data;
  DictionarySearchSuccess({required this.data});
}

final class DictionarySearchAddFavoriteFailing extends DictionarySearchState {
  final String errMessage;
  DictionarySearchAddFavoriteFailing({required this.errMessage});
}
