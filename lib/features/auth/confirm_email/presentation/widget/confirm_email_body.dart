import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduate_project/core/dependency_injection/di.dart';
import 'package:graduate_project/core/helper/show_awson_dialog.dart';
import 'package:graduate_project/core/helper/show_snack_bar.dart';
import 'package:graduate_project/core/resource/color_manager.dart';
import 'package:graduate_project/core/resource/distance_manager.dart';
import 'package:graduate_project/core/resource/padding_manager.dart';
import 'package:graduate_project/core/resource/string_manager.dart';
import 'package:graduate_project/core/resource/text_style_manager.dart';
import 'package:graduate_project/core/widget/cutsom_app_bar_of_sub_page.dart';
import 'package:graduate_project/core/widget/otp.dart';
import 'package:graduate_project/features/auth/confirm_email/manager/cubit/confirm_email_cubit.dart';
import 'package:graduate_project/features/auth/confirm_email/presentation/widget/error_confirm_screen.dart';

import '../../../../../core/widget/default_button.dart';

class ConfirmEmailBody extends StatefulWidget {
  const ConfirmEmailBody({super.key});

  @override
  State<ConfirmEmailBody> createState() => _ConfirmEmailBodyState();
}

class _ConfirmEmailBodyState extends State<ConfirmEmailBody> {
  @override
  void dispose() {
    di<ConfirmEmailCubit>().disposeControllers();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CutsomAppBarOfSubPage(),
            SizedBox(
              height: HeightManager.h43,
            ),
            Padding(
              padding: PaddingManager.paddingHorizontal16,
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
                    padding: EdgeInsets.symmetric(horizontal: WidthManager.w46),
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
                      if (state is SendConfirmEmailFirstTimeFailingNoInternet) {
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
                      return OTP(
                        formKey: ConfirmEmailCubit.get(context).globalKey,
                        autovalidateMode:
                            ConfirmEmailCubit.get(context).autovalidateMode,
                        c1: ConfirmEmailCubit.get(context).c1,
                        c2: ConfirmEmailCubit.get(context).c2,
                        c3: ConfirmEmailCubit.get(context).c3,
                        c4: ConfirmEmailCubit.get(context).c4,
                        c5: ConfirmEmailCubit.get(context).c5,
                        c6: ConfirmEmailCubit.get(context).c6,
                      );
                    },
                  ),
                ],
              ),
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
                        onTap: ConfirmEmailCubit.get(context).resentCode,
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
                      ConfirmEmailCubit.get(context).timeSTring,
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
                  if (Navigator.canPop(context)) {
                    showAwesonDialog(
                        context: context,
                        title: 'Success',
                        subtitle: 'Your Email Confirm Success');
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
                  onPressed: ConfirmEmailCubit.get(context).sendCode,
                );
              },
            ),
            SizedBox(height: HeightManager.h40),
            SizedBox(
              height: MediaQuery.of(context).viewInsets.bottom,
            ),
          ],
        ),
      ),
    );
  }
}
