part of 'manager_user_data_cubit.dart';

@immutable
sealed class ManagerUserDataState {}

final class ManagerUserDataInitial extends ManagerUserDataState {}

final class ChangeUserData extends ManagerUserDataState {}
