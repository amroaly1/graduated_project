import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graduate_project/core/manager/text_form_field_cubit/text_form_field_state.dart';
import 'package:graduate_project/core/resource/icon_manager.dart';

class TextFormFieldCubit extends Cubit<TextFormFieldState> {
  TextFormFieldCubit({
    required this.isPassword,
  }) : super(TextFormFieldInit());

  static TextFormFieldCubit get(context) => BlocProvider.of(context);

  bool isPassword;
  bool hiddenText = true;

  bool isHiddern() {
    if (isPassword) {
      return hiddenText;
    } else {
      return false;
    }
  }

  String? currentIcon() {
    if (isPassword) {
      if (hiddenText) {
        return IconManager.visibiliyOff;
      } else {
        return IconManager.visibiliyOn;
      }
    } else {
      return null;
    }
  }

  Widget currentSuffix() {
    if (isPassword) {
      return InkWell(
        onTap: () {
          hiddenText = !hiddenText;
          emit(TextFormFieldChangeVisisbility());
        },
        child: SvgPicture.asset(
          currentIcon()!,
          fit: BoxFit.scaleDown,
        ),
      );
    } else {
      return SizedBox();
    }
  }
}
