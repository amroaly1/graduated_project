import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduate_project/core/manager/text_form_field_cubit/text_form_field_cubit.dart';
import 'package:graduate_project/core/manager/text_form_field_cubit/text_form_field_state.dart';
import 'package:graduate_project/core/resource/color_manager.dart';
import 'package:graduate_project/core/resource/distance_manager.dart';
import 'package:graduate_project/core/resource/font_family_manger.dart';
import 'package:graduate_project/core/resource/text_style_manager.dart';

class DefaultTextFormField extends StatelessWidget {
  const DefaultTextFormField({
    super.key,
    required this.hintText,
    this.isPassword = false,
    this.controller,
    this.validator,
    this.keyboardType,
    this.inputFormatters,
  });
  final String hintText;
  final bool isPassword;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TextFormFieldCubit(isPassword: isPassword),
      child: BlocBuilder<TextFormFieldCubit, TextFormFieldState>(
        builder: (context, state) {
          return TextFormField(
            controller: controller,
            validator: validator,
            style: TextStyleManager.bold16(
              fontFamily: FontFamilyManger.avenirLTStd,
            ),
            inputFormatters: inputFormatters,
            obscureText: TextFormFieldCubit.get(context).isHiddern(),
            obscuringCharacter: "*",
            keyboardType: keyboardType,
            decoration: InputDecoration(
              filled: true,
              fillColor: ColorManager.whight,
              border: outlineInputBoarder(),
              enabledBorder: outlineInputBoarder(),
              focusedBorder: outlineInputBoarder(color: ColorManager.blue),
              errorBorder: outlineInputBoarder(color: ColorManager.red),
              focusedErrorBorder: outlineInputBoarder(),
              disabledBorder: outlineInputBoarder(),
              hintText: hintText,
              hintStyle: TextStyleManager.bold16(
                color: ColorManager.blackwithOpacity50,
                fontFamily: FontFamilyManger.avenirLTStd,
              ),
              suffixIcon: TextFormFieldCubit.get(context).currentSuffix(),
            ),
          );
        },
      ),
    );
  }

  OutlineInputBorder outlineInputBoarder({Color color = ColorManager.gray}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(
        RaduisValueManager.r10,
      ),
      borderSide: BorderSide(
        color: color,
      ),
    );
  }
}
