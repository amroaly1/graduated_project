import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graduate_project/core/dependency_injection/di.dart';
import 'package:graduate_project/core/helper/app_validator.dart';
import 'package:graduate_project/core/helper/show_snack_bar.dart';
import 'package:graduate_project/core/resource/color_manager.dart';
import 'package:graduate_project/core/resource/device_height_width_manager.dart';
import 'package:graduate_project/core/resource/distance_manager.dart';
import 'package:graduate_project/core/resource/image_manager.dart';
import 'package:graduate_project/core/resource/padding_manager.dart';
import 'package:graduate_project/core/resource/string_manager.dart';
import 'package:graduate_project/core/resource/text_style_manager.dart';
import 'package:graduate_project/core/route/navigation_manager.dart';
import 'package:graduate_project/core/route/screen_manager.dart';
import 'package:graduate_project/core/widget/custom_naviagtion_between_auth.dart';
import 'package:graduate_project/core/widget/custom_text_field_auth.dart';
import 'package:graduate_project/core/widget/cutsom_app_bar_of_sub_page.dart';
import 'package:graduate_project/core/widget/default_button.dart';
import 'package:graduate_project/features/auth/forget_password/manager/cubit/forget_password_cubit.dart';

class ForgetPasswordBody extends StatefulWidget {
  const ForgetPasswordBody({super.key});

  @override
  State<ForgetPasswordBody> createState() => _ForgetPasswordBodyState();
}

class _ForgetPasswordBodyState extends State<ForgetPasswordBody> {
  @override
  void dispose() {
    di<ForgetPasswordCubit>().dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CutsomAppBarOfSubPage(
              showLogo: false,
            ),
            SizedBox(height: HeightManager.h19),
            SvgPicture.asset(
              ImageManager.forgetPasswordImage,
              height: DeviceHeightWidthManager.subOfHeight(
                  context, HeightOfDesign.h319),
              width: DeviceHeightWidthManager.subOfWidth(
                  context, WidthOfDesign.w364),
              alignment: Alignment.center,
            ),
            SizedBox(height: HeightManager.h11),
            Padding(
              padding: PaddingManager.paddingHorizontal24,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    StringManager.forgotpassword,
                    style: TextStyleManager.black32(
                      color: ColorManager.black,
                    ),
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(
                    height: HeightManager.h29,
                  ),
                  Text(
                    StringManager.forgetPassowrdHint,
                    style: TextStyleManager.bold16(
                      color: ColorManager.blackwithOpacity70,
                    ),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
            SizedBox(height: HeightManager.h22),
            BlocBuilder<ForgetPasswordCubit, ForgetPasswordState>(
              builder: (context, state) {
                return Form(
                  key: ForgetPasswordCubit.get(context).globalKey,
                  autovalidateMode:
                      ForgetPasswordCubit.get(context).autovalidateMode,
                  child: Padding(
                    padding: PaddingManager.paddingHorizontal24,
                    child: CustomTextFieldAuth(
                      labelText: StringManager.emailaddress,
                      hintText: StringManager.forgetPassowrdEmailHint,
                      validator: AppValidator.emailValidator,
                      controller:
                          ForgetPasswordCubit.get(context).emailController,
                    ),
                  ),
                );
              },
            ),
            SizedBox(height: HeightManager.h40),
            BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
              listener: (context, state) {
                if (state is ForgetPasswordSendFailing) {
                  showSnackBar(context, message: state.errorMessage);
                } else if (state is ForgetPasswordSendSuccess) {
                  showSnackBar(context, message: state.email);
                }
              },
              builder: (context, state) {
                return state is ForgetPasswordSendLoading
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : DefaultButton(
                        text: StringManager.sendCode,
                        onPressed: ForgetPasswordCubit.get(context).onTap,
                      );
              },
            ),
            SizedBox(height: HeightManager.h40),
            CustomNavigationBetweenAuth(
              hint: StringManager.forgetPassowrdNavigationHint,
              pageTitle: StringManager.login,
              onTap: () {
                NavigationManager.pushReplace(
                    context: context, screen: ScreenManager.loginView);
              },
            ),
            SizedBox(height: HeightManager.h32),
            SizedBox(
              height: HeightExternal.keyBoardHeight(context),
            ),
          ],
        ),
      ),
    );
  }
}
