import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduate_project/core/dependency_injection/di.dart';
import 'package:graduate_project/core/helper/show_confirm_alert_dialog.dart';
import 'package:graduate_project/core/manager/manage_user_data/manager_user_data_cubit.dart';
import 'package:graduate_project/core/resource/color_manager.dart';
import 'package:graduate_project/core/resource/distance_manager.dart';
import 'package:graduate_project/core/resource/padding_manager.dart';
import 'package:graduate_project/core/resource/string_manager.dart';
import 'package:graduate_project/core/resource/text_style_manager.dart';
import 'package:graduate_project/core/widget/custom_text_field_auth.dart';
import 'package:graduate_project/core/widget/cutsom_app_bar_of_sub_page.dart';
import 'package:graduate_project/core/widget/default_button.dart';
import 'package:graduate_project/features/profile/manager/change_image_cubit/change_image_cubit.dart';
import 'package:graduate_project/features/profile/manager/edit_profile_cubit/edit_profile_cubit.dart';
import 'package:graduate_project/features/profile/presentation/widget/custom_profile_image.dart';

class EditProfileBodyView extends StatelessWidget {
  const EditProfileBodyView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: HeightManager.h60,
          ),
          CutsomAppBarOfSubPage(
            showLogo: false,
            title: Text(
              StringManager.editProfile,
              style: TextStyleManager.black24(
                color: ColorManager.blackwithOpacity70,
              ),
            ),
          ),
          SizedBox(
            height: HeightManager.h60,
          ),
          CustomProfileImage(
            canChangeImage: true,
          ),
          SizedBox(
            height: HeightManager.h29,
          ),
          Padding(
            padding: PaddingManager.paddingHorizontal24,
            child: Column(
              spacing: HeightManager.h20,
              children: [
                CustomTextFieldAuth(
                  labelText: StringManager.firstName,
                  hintText: "first name",
                  labelColor: ColorManager.blackwithOpacity70,
                  controller: EditProfileCubit.get(context).firstNameController,
                ),
                CustomTextFieldAuth(
                  labelText: StringManager.lastName,
                  hintText: "last name",
                  labelColor: ColorManager.blackwithOpacity70,
                  controller: EditProfileCubit.get(context).lastNameController,
                ),
              ],
            ),
          ),
          SizedBox(
            height: HeightManager.h40,
          ),
          BlocConsumer<EditProfileCubit, EditProfileState>(
            listener: (context, state) {
              if (state is UploadImageFailing) {
                log("call in ui faling");
                showConfirmAlertDialog(
                  isError: true,
                  title: StringManager.uploadimaegefailing,
                  subTitle: state.errorMessage,
                  buttonText: StringManager.okayThanks,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  context: context,
                );
              } else if (state is EditProfileFailing) {
                log("call in ui faling");
                showConfirmAlertDialog(
                  isError: true,
                  title: StringManager.editProfileFailing,
                  subTitle: state.errorMessage,
                  buttonText: StringManager.okayThanks,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  context: context,
                );
              } else if (state is EditProfileSuccess) {
                di<ManagerUserDataCubit>().changeData(
                  newfirstname: state.firsname,
                  newlastname: state.lastname,
                  newiamgeURL: state.imageUrl,
                );
                di<ChangeImageCubit>().image = null;

                showConfirmAlertDialog(
                  title: StringManager.profileSuccessfullyUpdated,
                  subTitle: StringManager.profileSuccessfullyUpdatedSubTitle,
                  buttonText: StringManager.okayThanks,
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.pop(context);
                  },
                  context: context,
                );
              }
            },
            builder: (context, state) {
              return state is EditProfileLoading
                  ? Center(child: CircularProgressIndicator())
                  : DefaultButton(
                      text: StringManager.savechanges,
                      onPressed: () => EditProfileCubit.get(context).saveChange(
                        image: di<ChangeImageCubit>().image,
                      ),
                    );
            },
          ),
          SizedBox(
            height: HeightManager.h15,
          ),
        ],
      ),
    );
  }
}
