import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graduate_project/core/dependency_injection/di.dart';
import 'package:graduate_project/core/manager/mic_cubit/mic_cubit.dart';
import 'package:graduate_project/core/resource/color_manager.dart';
import 'package:graduate_project/core/resource/distance_manager.dart';
import 'package:graduate_project/core/resource/icon_manager.dart';
import 'package:graduate_project/core/resource/padding_manager.dart';
import 'package:graduate_project/core/resource/string_manager.dart';
import 'package:graduate_project/core/resource/text_style_manager.dart';

class CustomChattingTextField extends StatelessWidget {
  const CustomChattingTextField({
    super.key,
    required this.controller,
    this.onTapSend,
  });
  final TextEditingController controller;
  final void Function()? onTapSend;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: PaddingManager.paddingHorizontal24,
      child: BlocProvider.value(
        value: di<MicCubit>(),
        child: TextField(
          controller: controller,
          style: TextStyleManager.light16(
            color: ColorManager.black,
          ),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
              horizontal: WidthManager.w21,
            ),
            filled: true,
            fillColor: ColorManager.whight,
            border: oulineInputBorder(),
            enabledBorder: oulineInputBorder(),
            focusedBorder: oulineInputBorder(),
            hintText: StringManager.askanything,
            hintStyle: TextStyleManager.light16(
              color: ColorManager.gray1,
            ),
            suffixIcon: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Material(
                  color: Colors.transparent,
                  child: BlocBuilder<MicCubit, MicState>(
                    builder: (context, state) {
                      return InkWell(
                        splashColor: Colors.grey.shade300,
                        borderRadius:
                            BorderRadius.circular(RaduisValueManager.r30),
                        onLongPress: MicCubit.get(context).speechDied
                            ? null
                            : () {
                                MicCubit.get(context).startListening(
                                  controller: controller,
                                );
                              },
                        child: Container(
                          width: WidthManager.w35,
                          decoration: BoxDecoration(
                            // color: Colors.black,
                            shape: BoxShape.circle,
                          ),
                          child: SvgPicture.asset(
                            IconManager.micicon,
                            width: WidthManager.w29,
                            height: HeightManager.h29,
                            colorFilter: ColorFilter.mode(
                                MicCubit.get(context).speechDied
                                    ? ColorManager.gray10
                                    : MicCubit.get(context).startTransalte
                                        ? Colors.blue
                                        : ColorManager.primaryColor,
                                BlendMode.srcIn),
                            fit: BoxFit.scaleDown,
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    splashColor: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(RaduisValueManager.r30),
                    onTap: onTapSend,
                    child: Container(
                      width: WidthManager.w35,
                      decoration: BoxDecoration(
                        // color: Colors.black,
                        shape: BoxShape.circle,
                      ),
                      child: SvgPicture.asset(
                        IconManager.sendarrowIcon,
                        width: WidthManager.w24,
                        height: HeightManager.h24,
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: WidthManager.w13,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  OutlineInputBorder oulineInputBorder() {
    return OutlineInputBorder(
      borderSide: BorderSide(
        color: ColorManager.whight,
      ),
      borderRadius: BorderRadius.circular(
        RaduisValueManager.r30,
      ),
    );
  }
}
