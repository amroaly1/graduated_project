part of 'home_dictionary_cubit.dart';

@immutable
sealed class HomeDictionaryState {}

final class HomeDictionaryInitial extends HomeDictionaryState {}

final class GetDataLoading extends HomeDictionaryState {}

final class GetDataFailing extends HomeDictionaryState {
  final String errMessage;
  GetDataFailing({required this.errMessage});
}

final class ShowWordInitialVideoInitilal extends HomeDictionaryState {}

final class ShowWordInitialVideoChangePlayOrStop extends HomeDictionaryState {}
