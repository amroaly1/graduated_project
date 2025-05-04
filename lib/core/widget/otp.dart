import 'package:flutter/material.dart';
import 'package:graduate_project/core/widget/otp_text_form_field.dart';

class OTP extends StatelessWidget {
  const OTP({
    super.key,
    required this.formKey,
    required this.autovalidateMode,
    required this.c1,
    required this.c2,
    required this.c3,
    required this.c4,
    required this.c5,
    required this.c6,
  });
  final GlobalKey<FormState> formKey;
  final AutovalidateMode autovalidateMode;
  final TextEditingController c1;
  final TextEditingController c2;
  final TextEditingController c3;
  final TextEditingController c4;
  final TextEditingController c5;
  final TextEditingController c6;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Form(
          key: formKey,
          autovalidateMode: autovalidateMode,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: MediaQuery.sizeOf(context).width * 0.03,
            children: [
              OTPTextFormField(
                controller: c1,
                isFirst: true,
                isLast: false,
              ),
              OTPTextFormField(
                controller: c2,
                isFirst: false,
                isLast: false,
              ),
              OTPTextFormField(
                controller: c3,
                isFirst: false,
                isLast: false,
              ),
              OTPTextFormField(
                controller: c4,
                isFirst: false,
                isLast: false,
              ),
              OTPTextFormField(
                controller: c5,
                isFirst: false,
                isLast: false,
              ),
              OTPTextFormField(
                controller: c6,
                isFirst: false,
                isLast: true,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
