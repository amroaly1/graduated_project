import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graduate_project/core/dependency_injection/di.dart';
import 'package:graduate_project/core/manager/mic_cubit/mic_cubit.dart';
import 'package:graduate_project/core/resource/color_manager.dart';
import 'package:graduate_project/core/resource/distance_manager.dart';
import 'package:graduate_project/core/resource/font_family_manger.dart';
import 'package:graduate_project/core/resource/font_size_manager.dart';
import 'package:graduate_project/core/resource/font_weight_manager.dart';
import 'package:graduate_project/core/resource/icon_manager.dart';
import 'package:graduate_project/core/resource/string_manager.dart';
import 'package:graduate_project/core/resource/text_style_manager.dart';

class CustomChatTextFieldSend extends StatelessWidget {
  const CustomChatTextFieldSend({
    super.key,
    required this.controller,
    this.onChanged,
    this.onTapSend,
  });
  final TextEditingController controller;
  final void Function(String)? onChanged;
  final void Function()? onTapSend;

  @override
  Widget build(BuildContext context) {
    var outlineInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(RaduisValueManager.r30),
      borderSide: BorderSide.none,
    );
    return BlocProvider.value(
      value: di<MicCubit>(),
      child: Container(
        decoration: BoxDecoration(
          color: ColorManager.primaryColorlight,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: WidthManager.w10,
            vertical: HeightManager.h11,
          ),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: controller,
                  onChanged: onChanged,
                  style: TextStyleManager.medium20(
                    color: ColorManager.black,
                    size: FontSizeManager.s13,
                    fontFamily: FontFamilyManger.avenirLTStd,
                    fontWeight: FontWeightManager.semiBold,
                  ),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: WidthManager.w10,
                    ),
                    filled: true,
                    fillColor: ColorManager.whight,
                    border: outlineInputBorder,
                    focusedBorder: outlineInputBorder,
                    enabledBorder: outlineInputBorder,
                    hintText: StringManager.typeyourmessagehere,
                    hintStyle: TextStyleManager.medium20(
                      color: ColorManager.gray10,
                      size: FontSizeManager.s13,
                      fontFamily: FontFamilyManger.avenirLTStd,
                      fontWeight: FontWeightManager.semiBold,
                    ),
                    prefixIcon: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        BlocBuilder<MicCubit, MicState>(
                          builder: (context, state) {
                            return InkWell(
                              onLongPress: MicCubit.get(context).speechDied
                                  ? null
                                  : () {
                                      MicCubit.get(context).startListening(
                                        controller: controller,
                                      );
                                    },
                              child: IconButton(
                                onPressed: MicCubit.get(context).speechDied
                                    ? null
                                    : () {},
                                icon: SvgPicture.asset(
                                  IconManager.recordIcon2,
                                  colorFilter: ColorFilter.mode(
                                    MicCubit.get(context).speechDied
                                        ? ColorManager.gray10
                                        : MicCubit.get(context).startTransalte
                                            ? Colors.blue
                                            : ColorManager.primaryColor,
                                    BlendMode.srcIn,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                        Container(
                          height: HeightManager.h29,
                          width: WidthManager.w1_5,
                          color: ColorManager.gray10,
                        ),
                        SizedBox(
                          width: WidthManager.w10,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: WidthManager.w4,
              ),
              Material(
                color: Colors.transparent,
                child: InkWell(
                  splashColor: Colors.grey.shade400,
                  borderRadius: BorderRadius.circular(RaduisValueManager.r10),
                  onTap: onTapSend,
                  child: Container(
                    padding: EdgeInsets.only(
                      left: WidthManager.w14,
                      right: WidthManager.w10,
                      top: HeightManager.h10,
                      bottom: HeightManager.h10,
                    ),
                    decoration: BoxDecoration(
                      color: ColorManager.whight,
                      shape: BoxShape.circle,
                    ),
                    child: SvgPicture.asset(
                      IconManager.sendicon,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
