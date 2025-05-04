import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduate_project/core/dependency_injection/di.dart';
import 'package:graduate_project/features/auth/forget_password/manager/cubit/forget_password_cubit.dart';
import 'package:graduate_project/features/auth/forget_password/presentation/widget/forget_password_body.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: di<ForgetPasswordCubit>()..init(),
      child: const Scaffold(
        body: ForgetPasswordBody(),
      ),
    );
  }
}
