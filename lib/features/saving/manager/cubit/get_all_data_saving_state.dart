part of 'get_all_data_saving_cubit.dart';

@immutable
sealed class GetAllDataSavingState {}

final class GetAllDataSavingInitial extends GetAllDataSavingState {}

final class GetAllDataSavingLoading extends GetAllDataSavingState {}

final class GetAllDataSavingSuccess extends GetAllDataSavingState {}

final class GetAllDataSavingFailing extends GetAllDataSavingState {
  final String errMessage;

  GetAllDataSavingFailing({required this.errMessage});
}
