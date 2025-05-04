import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduate_project/core/dependency_injection/di.dart';
import 'package:graduate_project/features/auth/reset_password/manager/cubit/reset_password_cubit.dart';
import 'package:graduate_project/features/auth/reset_password/presentation/widget/reset_password_body.dart';

class ResetPasswordView extends StatelessWidget {
  const ResetPasswordView({super.key, required this.email});
  final String email;
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: di<ResetPasswordCubit>()..init(email: email),
      child: const Scaffold(
        body: ResetPasswordBody(),
      ),
    );
  }
}
