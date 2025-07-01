part of 'edit_profile_cubit.dart';

@immutable
sealed class EditProfileState {}

final class EditProfileInitial extends EditProfileState {}

final class EditProfileLoading extends EditProfileState {}

// ignore: must_be_immutable
final class EditProfileSuccess extends EditProfileState {
  final String firsname;
  final String lastname;
  String? imageUrl;

  EditProfileSuccess(
      {required this.firsname, required this.lastname, this.imageUrl});
}

final class EditProfileFailing extends EditProfileState {
  final String errorMessage;
  EditProfileFailing({
    required this.errorMessage,
  });
}

final class UploadImageFailing extends EditProfileState {
  final String errorMessage;
  UploadImageFailing({
    required this.errorMessage,
  });
}
