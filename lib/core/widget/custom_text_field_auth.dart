import 'package:flutter/material.dart';
import 'package:graduate_project/core/resource/distance_manager.dart';
import 'package:graduate_project/core/resource/text_style_manager.dart';
import 'package:graduate_project/core/widget/default_text_form_field.dart';

class CustomTextFieldAuth extends StatelessWidget {
  const CustomTextFieldAuth({
    super.key,
    required this.labelText,
    required this.hintText,
    this.isPassword = false,
    this.controller,
    this.validator,
    this.keyboardType,
  });
  final String labelText;
  final String hintText;
  final bool isPassword;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          labelText,
          style: TextStyleManager.bold19(),
          textAlign: TextAlign.start,
        ),
        SizedBox(
          height: HeightManager.h6,
        ),
        DefaultTextFormField(
          hintText: hintText,
          isPassword: isPassword,
          controller: controller,
          validator: validator,
          keyboardType: keyboardType,
        ),
      ],
    );
  }
}
