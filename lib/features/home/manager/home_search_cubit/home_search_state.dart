part of 'home_search_cubit.dart';

@immutable
sealed class HomeSearchState {}

final class HomeSearchInitial extends HomeSearchState {}

final class HomeSearchLoadingState extends HomeSearchState {}

final class HomeSearchSuccessState extends HomeSearchState {}

final class HomeSearchErrorState extends HomeSearchState {
  final String errMessage;

  HomeSearchErrorState({required this.errMessage});
}
