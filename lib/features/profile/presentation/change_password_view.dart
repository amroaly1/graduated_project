import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduate_project/core/dependency_injection/di.dart';
import 'package:graduate_project/features/profile/manager/change_password.dart/change_password_cubit.dart';
import 'package:graduate_project/features/profile/presentation/widget/change_password_body_view.dart';

class ChangePasswordView extends StatelessWidget {
  const ChangePasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: di<ChangePasswordCubit>()..init(),
      child: const Scaffold(
        body: ChangePasswordBodyView(),
      ),
    );
  }
}
