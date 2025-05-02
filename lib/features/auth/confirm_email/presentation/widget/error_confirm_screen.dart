import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduate_project/core/resource/color_manager.dart';
import 'package:graduate_project/core/resource/distance_manager.dart';
import 'package:graduate_project/core/resource/font_family_manger.dart';
import 'package:graduate_project/core/resource/text_style_manager.dart';
import 'package:graduate_project/features/auth/confirm_email/manager/cubit/confirm_email_cubit.dart';

class ErrorConfirmScreen extends StatelessWidget {
  const ErrorConfirmScreen(
      {super.key, required this.icon, required this.errMessage});
  final IconData icon;
  final String errMessage;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: HeightManager.h40,
        ),
        Icon(
          icon,
          size: HeightManager.h100,
        ),
        SizedBox(
          height: HeightManager.h20,
        ),
        Text(
          errMessage,
          style: TextStyleManager.bold24(
            fontFamily: FontFamilyManger.avenirLTStd,
            color: ColorManager.black,
          ),
          textAlign: TextAlign.center,
        ),
        TextButton(
            onPressed: BlocProvider.of<ConfirmEmailCubit>(context).resentCode,
            // onPressed: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.refresh,
                  size: HeightManager.h20,
                ),
                SizedBox(width: WidthManager.w6),
                Text(
                  "Try Again",
                  style: TextStyleManager.semiBold16(),
                ),
              ],
            )),
      ],
    );
  }
}
