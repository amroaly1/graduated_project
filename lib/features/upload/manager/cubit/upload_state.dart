sealed class UploadState {}

final class UploadInitial extends UploadState {}

final class UploadVideoDone extends UploadState {}

final class UploadVideoUpdateUi extends UploadState {}
