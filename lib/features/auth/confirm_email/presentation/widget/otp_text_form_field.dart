import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduate_project/core/resource/color_manager.dart';
import 'package:graduate_project/core/resource/distance_manager.dart';
import 'package:graduate_project/features/auth/confirm_email/manager/cubit/confirm_email_cubit.dart';

class OTPTextFormField extends StatelessWidget {
  const OTPTextFormField({
    super.key,
    required this.isFirst,
    required this.isLast,
    required this.controller,
  });
  final bool isFirst;
  final bool isLast;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width * 0.1,
      height: HeightManager.h60,
      child: TextFormField(
        controller: controller,
        validator: BlocProvider.of<ConfirmEmailCubit>(context).validate,
        maxLines: 1,
        onChanged: (value) => BlocProvider.of<ConfirmEmailCubit>(context)
            .onChnage(
                value: value,
                isFirst: isFirst,
                isLast: isLast,
                context: context),
        keyboardType: TextInputType.number,
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
          LengthLimitingTextInputFormatter(1),
        ],
        textAlign: TextAlign.center,
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.zero,
            enabledBorder: outlineinputborder(),
            border: outlineinputborder(),
            focusedBorder: outlineinputborder(
              color: ColorManager.primaryColor,
            ),
            errorBorder: outlineinputborder(
              color: ColorManager.red,
            ),
            focusedErrorBorder: outlineinputborder(
              color: ColorManager.primaryColor,
            ),
            errorMaxLines: 1,
            errorStyle: TextStyle(height: 0, fontSize: 0)),
      ),
    );
  }

  OutlineInputBorder outlineinputborder({
    Color color = ColorManager.gray,
  }) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(
        RaduisValueManager.r8,
      ),
      borderSide: BorderSide(
        color: color,
        width: WidthManager.w1_5,
      ),
    );
  }
}
