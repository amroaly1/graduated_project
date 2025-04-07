import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduate_project/core/helper/app_validator.dart';
import 'package:graduate_project/core/resource/device_height_width_manager.dart';
import 'package:graduate_project/core/resource/distance_manager.dart';
import 'package:graduate_project/core/resource/padding_manager.dart';
import 'package:graduate_project/core/resource/string_manager.dart';
import 'package:graduate_project/core/resource/text_style_manager.dart';
import 'package:graduate_project/core/route/navigation_manager.dart';
import 'package:graduate_project/core/route/screen_manager.dart';
import 'package:graduate_project/core/widget/custom_naviagtion_between_auth.dart';
import 'package:graduate_project/core/widget/custom_text_field_auth.dart';
import 'package:graduate_project/core/widget/default_button.dart';
import 'package:graduate_project/core/widget/social_auth_section.dart';
import 'package:graduate_project/core/widget/top_section_of_auth.dart';
import 'package:graduate_project/features/auth/login/manager/cubit/login_cubit.dart';
import 'package:graduate_project/features/auth/login/manager/cubit/login_state.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TopSectionOfAuth(
              text: StringManager.login,
            ),
            Padding(
              padding: PaddingManager.paddingHorizontal24,
              child: Padding(
                padding: PaddingManager.paddingAuthBody19,
                child: BlocBuilder<LoginCubit, LoginState>(
                  builder: (context, state) {
                    return Form(
                      key: LoginCubit.get(context).globalKey,
                      autovalidateMode:
                          LoginCubit.get(context).autovalidateMode,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        spacing: HeightManager.h22,
                        children: [
                          CustomTextFieldAuth(
                            labelText: StringManager.emailaddress,
                            hintText: StringManager.emailHintText,
                            controller: LoginCubit.get(context).emailCotroller,
                            validator: AppValidator.emailValidator,
                          ),
                          CustomTextFieldAuth(
                            labelText: StringManager.password,
                            hintText: StringManager.hintPassword,
                            isPassword: true,
                            controller:
                                LoginCubit.get(context).passwordCotroller,
                            validator: AppValidator.passwordValidator,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                style: ElevatedButton.styleFrom(
                  padding: PaddingManager.paddingHorizontal24,
                ),
                onPressed: () {
                  NavigationManager.push(
                      context: context,
                      screen: ScreenManager.forgetPasswordView);
                },
                child: Text(
                  StringManager.forgotpassword,
                  style: TextStyleManager.black16(),
                ),
              ),
            ),
            SizedBox(height: HeightManager.h20),
            BlocListener<LoginCubit, LoginState>(
              listener: (context, state) {
                if (state is LoginSuccess) {
                  NavigationManager.pushNameAndReplaseUnti(
                      context: context, screen: ScreenManager.homeView);
                }
              },
              child: DefaultButton(
                text: StringManager.login,
                onPressed: LoginCubit.get(context).onTap,
              ),
            ),
            SizedBox(height: HeightManager.h52),
            SocialAuthSection(
              title: StringManager.orLoginwith,
              onTapFaceBook: () {},
              onTapGoogle: () {},
              onTapApple: () {},
            ),
            SizedBox(
              height: HeightManager.h29,
            ),
            CustomNavigationBetweenAuth(
              pageTitle: StringManager.signUp,
              onTap: () {
                NavigationManager.pushReplace(
                    context: context, screen: ScreenManager.siginUpView);
              },
              hint: StringManager.donthaveanaccount,
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
