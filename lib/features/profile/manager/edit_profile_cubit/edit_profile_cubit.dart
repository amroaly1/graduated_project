import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduate_project/core/network/api_keys.dart';
import 'package:graduate_project/core/storage/shared_preference_helper.dart';
import 'package:graduate_project/features/profile/data/repo/edit_profile_repo.dart';
import 'package:image_picker/image_picker.dart';
// ignore: depend_on_referenced_packages, unnecessary_import
import 'package:meta/meta.dart';

part 'edit_profile_state.dart';

class EditProfileCubit extends Cubit<EditProfileState> {
  EditProfileCubit(this.repo) : super(EditProfileInitial());

  final EditProfileRepo repo;
  static EditProfileCubit get(context) => BlocProvider.of(context);

  String? imageUrl;
  String? uploadImageError;
  String? editProfileErrro;

  late TextEditingController firstNameController;
  late TextEditingController lastNameController;
  final SharedPreferenceHelper cacheHelper = SharedPreferenceHelper();

  void init() {
    firstNameController = TextEditingController(
      text: cacheHelper.getDataString(key: ApiKeys.firstName),
    );
    lastNameController = TextEditingController(
      text: cacheHelper.getDataString(key: ApiKeys.lastName),
    );
  }

  Future<bool> uploadImageToServer(XFile image) async {
    var result = await repo.uploadImageToServer(image);
    bool correct = true;
    result.fold(
      (error) {
        uploadImageError = error;
        log("Image error : $error");
        correct = false;
      },
      (url) {
        imageUrl = url;
        log("Image Url : $url");
        correct = true;
      },
    );

    return correct;
  }

  Future<bool> editProfile() async {
    var result = await repo.updateProfile(
      firstname: firstNameController.text,
      lastname: lastNameController.text,
      imageurl: imageUrl ?? "",
    );

    bool correct = true;

    result.fold(
      (error) {
        editProfileErrro = error;
        log("Error : $error");
        correct = false;
      },
      (value) {
        correct = true;
      },
    );

    return correct;
  }

  void saveChange({
    XFile? image,
  }) async {
    emit(EditProfileLoading());

    if (image != null) {
      bool isUpload = await uploadImageToServer(image);
      if (!isUpload) {
        log("call error");
        emit(UploadImageFailing(errorMessage: uploadImageError!));
        return;
      }
    }

    bool isEdit = await editProfile();
    if (!isEdit) {
      log("call error");
      emit(EditProfileFailing(errorMessage: editProfileErrro!));
      return;
    }

    emit(EditProfileSuccess(
      firsname: firstNameController.text,
      lastname: lastNameController.text,
      imageUrl: imageUrl,
    ));
  }
}
