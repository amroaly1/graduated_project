import 'package:flutter/material.dart';
import 'package:graduate_project/core/resource/device_height_width_manager.dart';
import 'package:graduate_project/core/resource/distance_manager.dart';
import 'package:graduate_project/core/resource/padding_manager.dart';
import 'package:graduate_project/core/resource/string_manager.dart';
import 'package:graduate_project/core/route/navigation_manager.dart';
import 'package:graduate_project/core/route/screen_manager.dart';
import 'package:graduate_project/core/widget/custom_naviagtion_between_auth.dart';
import 'package:graduate_project/core/widget/custom_text_field_auth.dart';
import 'package:graduate_project/core/widget/default_button.dart';
import 'package:graduate_project/core/widget/social_auth_section.dart';
import 'package:graduate_project/core/widget/top_section_of_auth.dart';

class SiginUpBody extends StatelessWidget {
  const SiginUpBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TopSectionOfAuth(
              text: StringManager.signUp,
            ),
            Padding(
              padding: PaddingManager.paddingHorizontal24,
              child: Padding(
                padding: PaddingManager.paddingAuthBody19,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  spacing: HeightManager.h22,
                  children: [
                    CustomTextFieldAuth(
                      labelText: StringManager.email,
                      hintText: StringManager.emailHintText,
                    ),
                    CustomTextFieldAuth(
                      labelText: StringManager.createaPassword,
                      hintText: StringManager.hintPassword,
                      isPassword: true,
                    ),
                    CustomTextFieldAuth(
                      labelText: StringManager.confirmPassword,
                      hintText: StringManager.hintConfirmPassword,
                      isPassword: true,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: HeightManager.h24,
            ),
            DefaultButton(
              text: StringManager.signUpbutton,
              onPressed: () {},
            ),
            SizedBox(height: HeightManager.h24),
            SocialAuthSection(
              title: StringManager.orRegisterWith,
              onTapFaceBook: () {},
              onTapGoogle: () {},
              onTapApple: () {},
            ),
            SizedBox(
              height: HeightManager.h29,
            ),
            CustomNavigationBetweenAuth(
              pageTitle: StringManager.login,
              onTap: () {
                NavigationManager.pushReplace(
                    context: context, screen: ScreenManager.loginView);
              },
              hint: StringManager.alreadyhaveanaccount,
            ),
            SizedBox(
              height: HeightExternal.keyBoardHeight(context),
            ),
          ],
        ),
      ),
    );
  }
}
