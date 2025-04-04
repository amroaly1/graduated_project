import 'package:flutter/material.dart';
import 'package:graduate_project/core/resource/color_manager.dart';
import 'package:graduate_project/core/resource/text_style_manager.dart';

class CustomNavigationBetweenAuth extends StatelessWidget {
  const CustomNavigationBetweenAuth({
    super.key,
    required this.hint,
    required this.pageTitle,
    this.onTap,
  });
  final String hint;
  final String pageTitle;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          hint,
          style: TextStyleManager.bold14(
            color: ColorManager.blackwithOpacity70,
          ),
        ),
        InkWell(
          onTap: onTap,
          child: Text(
            pageTitle,
            style: TextStyleManager.bold14(),
          ),
        ),
      ],
    );
  }
}
