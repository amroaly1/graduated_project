import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduate_project/core/dependency_injection/di.dart';
import 'package:graduate_project/core/helper/app_validator.dart';
import 'package:graduate_project/core/helper/show_awson_dialog.dart';
import 'package:graduate_project/core/helper/show_snack_bar.dart';
import 'package:graduate_project/core/resource/color_manager.dart';
import 'package:graduate_project/core/resource/distance_manager.dart';
import 'package:graduate_project/core/resource/padding_manager.dart';
import 'package:graduate_project/core/resource/string_manager.dart';
import 'package:graduate_project/core/resource/text_style_manager.dart';
import 'package:graduate_project/core/route/navigation_manager.dart';
import 'package:graduate_project/core/widget/custom_text_field_auth.dart';
import 'package:graduate_project/core/widget/cutsom_app_bar_of_sub_page.dart';
import 'package:graduate_project/core/widget/default_button.dart';
import 'package:graduate_project/features/auth/reset_password/manager/cubit/reset_password_cubit.dart';

class ResetPasswordBody extends StatefulWidget {
  const ResetPasswordBody({super.key});

  @override
  State<ResetPasswordBody> createState() => _ResetPasswordBodyState();
}

class _ResetPasswordBodyState extends State<ResetPasswordBody> {
  @override
  void dispose() {
    di<ResetPasswordCubit>().dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CutsomAppBarOfSubPage(),
            Padding(
              padding: PaddingManager.paddingHorizontal16,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: HeightManager.h49,
                  ),
                  Text(
                    StringManager.resetpassword,
                    style: TextStyleManager.black36(),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: HeightManager.h16),
                  Text(
                    StringManager.resetpasswordhint,
                    style: TextStyleManager.semiBold16(
                      color: ColorManager.blackwithOpacity70,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: HeightManager.h44),
                  BlocBuilder<ResetPasswordCubit, ResetPasswordState>(
                    builder: (context, state) {
                      return Form(
                        key: ResetPasswordCubit.get(context).globalKey,
                        autovalidateMode:
                            ResetPasswordCubit.get(context).autovalidateMode,
                        child: Column(
                          spacing: HeightManager.h29,
                          children: [
                            CustomTextFieldAuth(
                              labelText: StringManager.enterCode,
                              hintText: StringManager.enterCodehint,
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                                LengthLimitingTextInputFormatter(6),
                              ],
                              controller: ResetPasswordCubit.get(context)
                                  .enterCodeController,
                              validator:
                                  ResetPasswordCubit.get(context).codeValidator,
                            ),
                            CustomTextFieldAuth(
                              labelText: StringManager.newpassword,
                              hintText: StringManager.newpasswordhint,
                              keyboardType: TextInputType.text,
                              controller: ResetPasswordCubit.get(context)
                                  .newPasswordController,
                              isPassword: true,
                              validator: AppValidator.passwordValidator,
                            ),
                            CustomTextFieldAuth(
                              labelText: StringManager.confirmNewpassword,
                              hintText: StringManager.confirmNewpasswordhint,
                              keyboardType: TextInputType.text,
                              controller: ResetPasswordCubit.get(context)
                                  .newConfrimPasswordController,
                              isPassword: true,
                              validator: ResetPasswordCubit.get(context)
                                  .confirmPassword,
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: HeightManager.h52),
            BlocConsumer<ResetPasswordCubit, ResetPasswordState>(
              listener: (context, state) {
                if (state is ResetPasswordFailing) {
                  showSnackBar(context, message: state.errMessage);
                } else if (state is ResetPasswordSuccess) {
                  showAwesonDialog(
                    context: context,
                    title: "Success",
                    subtitle: "Success Change Password",
                    btnOkOnPress: () {
                      NavigationManager.pop(context: context);
                    },
                  );
                }
              },
              builder: (context, state) {
                return state is ResetPasswordLoading
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : DefaultButton(
                        text: StringManager.resetPassword,
                        onPressed: ResetPasswordCubit.get(context).onTap,
                      );
              },
            ),
          ],
        ),
      ),
    );
  }
}
