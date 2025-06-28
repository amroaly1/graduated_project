import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graduate_project/core/helper/show_confirm_alert_dialog.dart';
import 'package:graduate_project/core/resource/color_manager.dart';
import 'package:graduate_project/core/resource/distance_manager.dart';
import 'package:graduate_project/core/resource/image_manager.dart';
import 'package:graduate_project/core/resource/padding_manager.dart';
import 'package:graduate_project/core/resource/string_manager.dart';
import 'package:graduate_project/core/resource/text_style_manager.dart';
import 'package:graduate_project/core/widget/cutsom_app_bar_of_sub_page.dart';
import 'package:graduate_project/core/widget/default_button.dart';
import 'package:graduate_project/core/widget/default_text_form_field.dart';

class ChangePasswordBodyView extends StatelessWidget {
  const ChangePasswordBodyView({super.key});

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
              StringManager.changePassword,
              style: TextStyleManager.black24(
                color: ColorManager.blackwithOpacity70,
              ),
            ),
          ),
          SizedBox(
            height: HeightManager.h60,
          ),
          SizedBox(
            height: HeightManager.h250,
            child: SvgPicture.asset(
              ImageManager.changePassword,
            ),
          ),
          SizedBox(
            height: HeightManager.h29,
          ),
          Padding(
            padding: PaddingManager.paddingHorizontal24,
            child: Column(
              spacing: HeightManager.h20,
              children: [
                DefaultTextFormField(
                  hintText: StringManager.oldpassword,
                  isPassword: true,
                ),
                DefaultTextFormField(
                  hintText: StringManager.newpassword,
                  isPassword: true,
                ),
                DefaultTextFormField(
                  hintText: StringManager.confirmNewpassword,
                  isPassword: true,
                ),
              ],
            ),
          ),
          SizedBox(
            height: HeightManager.h40,
          ),
          DefaultButton(
            text: StringManager.confirmchanges,
            onPressed: () {
              showConfirmAlertDialog(
                title: StringManager.passwordSuccessfullyUpdated,
                subTitle: StringManager.passwordSuccessfullyUpdatedSubTitle,
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
