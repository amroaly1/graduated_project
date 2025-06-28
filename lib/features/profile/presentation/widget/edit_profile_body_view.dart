import 'package:flutter/material.dart';
import 'package:graduate_project/core/helper/show_confirm_alert_dialog.dart';
import 'package:graduate_project/core/resource/color_manager.dart';
import 'package:graduate_project/core/resource/distance_manager.dart';
import 'package:graduate_project/core/resource/padding_manager.dart';
import 'package:graduate_project/core/resource/string_manager.dart';
import 'package:graduate_project/core/resource/text_style_manager.dart';
import 'package:graduate_project/core/widget/custom_text_field_auth.dart';
import 'package:graduate_project/core/widget/cutsom_app_bar_of_sub_page.dart';
import 'package:graduate_project/core/widget/default_button.dart';
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
            onTapCamera: () {},
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
                  hintText: "Dina",
                  labelColor: ColorManager.blackwithOpacity70,
                ),
                CustomTextFieldAuth(
                  labelText: StringManager.lastName,
                  hintText: "mostafa",
                  labelColor: ColorManager.blackwithOpacity70,
                ),
              ],
            ),
          ),
          SizedBox(
            height: HeightManager.h40,
          ),
          DefaultButton(
            text: StringManager.savechanges,
            onPressed: () {
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
