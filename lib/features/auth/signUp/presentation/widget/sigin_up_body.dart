import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduate_project/core/dependency_injection/di.dart';
import 'package:graduate_project/core/helper/app_validator.dart';
import 'package:graduate_project/core/helper/show_snack_bar.dart';
import 'package:graduate_project/core/resource/device_height_width_manager.dart';
import 'package:graduate_project/core/resource/distance_manager.dart';
import 'package:graduate_project/core/resource/padding_manager.dart';
import 'package:graduate_project/core/resource/string_manager.dart';
import 'package:graduate_project/core/route/navigation_manager.dart';
import 'package:graduate_project/core/route/screen_manager.dart';
import 'package:graduate_project/core/widget/custom_naviagtion_between_auth.dart';
import 'package:graduate_project/core/widget/custom_text_field_auth.dart';
import 'package:graduate_project/core/widget/default_button.dart';
import 'package:graduate_project/core/widget/top_section_of_auth.dart';
import 'package:graduate_project/features/auth/signUp/manager/cubit/sigin_up_cubit.dart';
import 'package:graduate_project/features/auth/signUp/manager/cubit/sigin_up_state.dart';

class SiginUpBody extends StatefulWidget {
  const SiginUpBody({super.key});

  @override
  State<SiginUpBody> createState() => _SiginUpBodyState();
}

class _SiginUpBodyState extends State<SiginUpBody> {
  @override
  void dispose() {
    di<SiginUpCubit>().dispose();
    super.dispose();
  }

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
              padding: PaddingManager.paddingHorizontal16,
              child: Padding(
                padding: PaddingManager.paddingAuthBody19,
                child: BlocBuilder<SiginUpCubit, SiginUpState>(
                  builder: (context, state) {
                    return Form(
                      key: SiginUpCubit.get(context).globalKey,
                      autovalidateMode:
                          SiginUpCubit.get(context).autovalidateMode,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        spacing: HeightManager.h22,
                        children: [
                          CustomTextFieldAuth(
                            labelText: StringManager.firstName,
                            hintText: StringManager.firstNameHint,
                            controller:
                                SiginUpCubit.get(context).firstNameCotroller,
                            validator: (String? value) =>
                                AppValidator.nameValidator(
                                    value, StringManager.firstName),
                          ),
                          CustomTextFieldAuth(
                            labelText: StringManager.lastName,
                            hintText: StringManager.lastNameHint,
                            controller:
                                SiginUpCubit.get(context).lastNameCotroller,
                            validator: (String? value) =>
                                AppValidator.nameValidator(
                                    value, StringManager.lastName),
                          ),
                          CustomTextFieldAuth(
                            labelText: StringManager.email,
                            hintText: StringManager.emailHintText,
                            controller:
                                SiginUpCubit.get(context).emailCotroller,
                            validator: AppValidator.emailValidator,
                          ),
                          CustomTextFieldAuth(
                            labelText: StringManager.createaPassword,
                            hintText: StringManager.hintPassword,
                            isPassword: true,
                            controller:
                                SiginUpCubit.get(context).passwordCotroller,
                            validator: AppValidator.passwordValidator,
                          ),
                          CustomTextFieldAuth(
                            labelText: StringManager.confirmPassword,
                            hintText: StringManager.hintConfirmPassword,
                            isPassword: true,
                            controller: SiginUpCubit.get(context)
                                .confirmPasswordCotroller,
                            validator: SiginUpCubit.get(context)
                                .confirmPasswordValidator,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
            SizedBox(
              height: HeightManager.h24,
            ),
            BlocConsumer<SiginUpCubit, SiginUpState>(
              listener: (context, state) {
                if (state is SiginUpSuccess) {
                  NavigationManager.pushReplace(
                      context: context,
                      screen: ScreenManager.confirmEmail,
                      arguments: state.email);
                } else if (state is SiginUpFailing) {
                  showSnackBar(context, message: state.errMessage);
                }
              },
              builder: (context, state) {
                return state is SiginUpLoading
                    ? Center(child: CircularProgressIndicator())
                    : DefaultButton(
                        text: StringManager.signUpbutton,
                        onPressed: SiginUpCubit.get(context).onTap,
                      );
              },
            ),
            // SizedBox(height: HeightManager.h24),
            // SocialAuthSection(
            //   title: StringManager.orRegisterWith,
            //   onTapFaceBook: () {},
            //   onTapGoogle: () {},
            //   onTapApple: () {},
            // ),
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
              height: HeightManager.h29,
            ),
            SizedBox(
              height: HeightExternal.keyBoardHeight(context),
            ),
            SizedBox(
              height: HeightManager.h29,
            ),
          ],
        ),
      ),
    );
  }
}
