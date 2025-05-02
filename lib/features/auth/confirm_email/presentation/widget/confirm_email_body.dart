import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduate_project/core/dependency_injection/di.dart';
import 'package:graduate_project/core/helper/show_snack_bar.dart';
import 'package:graduate_project/core/resource/color_manager.dart';
import 'package:graduate_project/core/resource/distance_manager.dart';
import 'package:graduate_project/core/resource/padding_manager.dart';
import 'package:graduate_project/core/resource/string_manager.dart';
import 'package:graduate_project/core/resource/text_style_manager.dart';
import 'package:graduate_project/core/route/navigation_manager.dart';
import 'package:graduate_project/core/route/screen_manager.dart';
import 'package:graduate_project/core/widget/cutsom_app_bar_of_sub_page.dart';
import 'package:graduate_project/core/widget/default_button.dart';
import 'package:graduate_project/features/auth/confirm_email/manager/cubit/confirm_email_cubit.dart';
import 'package:graduate_project/features/auth/confirm_email/presentation/widget/error_confirm_screen.dart';
import 'package:graduate_project/features/auth/confirm_email/presentation/widget/otp_text_form_field.dart';

class ConfirmEmailBody extends StatefulWidget {
  const ConfirmEmailBody({super.key});

  @override
  State<ConfirmEmailBody> createState() => _ConfirmEmailBodyState();
}

class _ConfirmEmailBodyState extends State<ConfirmEmailBody> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      onPopInvokedWithResult: (didPop, result) {
        BlocProvider.of<ConfirmEmailCubit>(context).disposeControllers();
      },
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              CutsomAppBarOfSubPage(
                onTap: () {
                  BlocProvider.of<ConfirmEmailCubit>(context)
                      .disposeControllers();
                  NavigationManager.pop(context: context);
                },
              ),
              SizedBox(
                height: HeightManager.h43,
              ),
              Padding(
                padding: PaddingManager.paddingHorizontal24,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      StringManager.verifycode,
                      style: TextStyleManager.black36(),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: HeightManager.h16),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: WidthManager.w46),
                      child: Text(
                        StringManager.verifycodedesc,
                        style: TextStyleManager.semiBold16(
                          color: ColorManager.blackwithOpacity70,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(height: HeightManager.h42),
                    BlocConsumer<ConfirmEmailCubit, ConfirmEmailState>(
                      listener: (context, state) {
                        if (state is SendConfirmEmailFailing) {
                          showSnackBar(context, message: state.errorMessage);
                        }
                      },
                      builder: (context, state) {
                        if (state
                            is SendConfirmEmailFirstTimeFailingNoInternet) {
                          return ErrorConfirmScreen(
                            icon: Icons.wifi_off,
                            errMessage: state.errorMessage,
                          );
                        } else if (state is SendConfirmEmailFirstTimeFailing) {
                          return ErrorConfirmScreen(
                            icon: Icons.error_outline_rounded,
                            errMessage: state.errorMessage,
                          );
                        }
                        return ConfirmEmailBodyData();
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: HeightManager.h40),
              SizedBox(
                height: MediaQuery.of(context).viewInsets.bottom,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ConfirmEmailBodyData extends StatelessWidget {
  const ConfirmEmailBodyData({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        BlocBuilder<ConfirmEmailCubit, ConfirmEmailState>(
          builder: (context, state) {
            return Form(
              key: BlocProvider.of<ConfirmEmailCubit>(context).globalKey,
              autovalidateMode:
                  BlocProvider.of<ConfirmEmailCubit>(context).autovalidateMode,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: MediaQuery.sizeOf(context).width * 0.03,
                children: [
                  OTPTextFormField(
                    controller: BlocProvider.of<ConfirmEmailCubit>(context).c1,
                    isFirst: true,
                    isLast: false,
                  ),
                  OTPTextFormField(
                    controller: BlocProvider.of<ConfirmEmailCubit>(context).c2,
                    isFirst: false,
                    isLast: false,
                  ),
                  OTPTextFormField(
                    controller: BlocProvider.of<ConfirmEmailCubit>(context).c3,
                    isFirst: false,
                    isLast: false,
                  ),
                  OTPTextFormField(
                    controller: BlocProvider.of<ConfirmEmailCubit>(context).c4,
                    isFirst: false,
                    isLast: false,
                  ),
                  OTPTextFormField(
                    controller: BlocProvider.of<ConfirmEmailCubit>(context).c5,
                    isFirst: false,
                    isLast: false,
                  ),
                  OTPTextFormField(
                    controller: BlocProvider.of<ConfirmEmailCubit>(context).c6,
                    isFirst: false,
                    isLast: true,
                  ),
                ],
              ),
            );
          },
        ),
        SizedBox(
          height: HeightManager.h49,
        ),
        BlocBuilder<ConfirmEmailCubit, ConfirmEmailState>(
          builder: (context, state) {
            if (state is ConfirmEmailEndFirstCountCount) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    StringManager.idontreceivecode,
                    style: TextStyleManager.bold16(),
                    textAlign: TextAlign.center,
                  ),
                  InkWell(
                    onTap:
                        BlocProvider.of<ConfirmEmailCubit>(context).resentCode,
                    child: Text(
                      StringManager.reset,
                      style: TextStyleManager.bold16(
                        color: ColorManager.primaryColor,
                        height: 1,
                        decorationThickness: 1.5,
                        decorationColor: ColorManager.primaryColor,
                        decoration: TextDecoration.underline,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              );
            }
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  StringManager.sendcodeagain,
                  style: TextStyleManager.bold16(),
                  textAlign: TextAlign.center,
                ),
                Text(
                  BlocProvider.of<ConfirmEmailCubit>(context).timeSTring,
                  style: TextStyleManager.light16(),
                  textAlign: TextAlign.center,
                )
              ],
            );
          },
        ),
        SizedBox(height: HeightManager.h40),
        BlocConsumer<ConfirmEmailCubit, ConfirmEmailState>(
          listener: (context, state) {
            if (state is ConfirmEmailSuccess) {
              BlocProvider.of<ConfirmEmailCubit>(context).disposeControllers();
              if (Navigator.canPop(context)) {
                // Show dialog only if the current screen hasn't been popped
                AwesomeDialog(
                  context: context,
                  dialogType: DialogType.success,
                  animType: AnimType.rightSlide,
                  title: 'Success',
                  desc: 'Your Email Confirm Success',
                  btnOkOnPress: () {
                    NavigationManager.pushReplace(
                      context: context,
                      screen: ScreenManager.loginView,
                    );
                  },
                  dismissOnTouchOutside: false,
                ).show();
              }
            } else if (state is SendConfirmEmailFailing) {
              showSnackBar(context, message: state.errorMessage);
            } else if (state is ConfirmEmailNoValidate) {
              showSnackBar(context, message: state.errorMessage);
            } else if (state is ConfirmEmailFailing) {
              showSnackBar(context, message: state.errorMessage);
            }
          },
          builder: (context, state) {
            if (state is ConfirmEmailLoading) {
              return Center(child: CircularProgressIndicator());
            }
            return DefaultButton(
              text: "Verify",
              onPressed: BlocProvider.of<ConfirmEmailCubit>(context).sendCode,
            );
          },
        ),
      ],
    );
  }
}
