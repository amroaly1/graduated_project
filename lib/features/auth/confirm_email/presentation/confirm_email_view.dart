import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduate_project/core/dependency_injection/di.dart';
import 'package:graduate_project/features/auth/confirm_email/data/repo/confirm_email_repo.dart';
import 'package:graduate_project/features/auth/confirm_email/manager/cubit/confirm_email_cubit.dart';
import 'package:graduate_project/features/auth/confirm_email/presentation/widget/confirm_email_body.dart';

class ConfirmEmailView extends StatelessWidget {
  const ConfirmEmailView({super.key, required this.email});
  final String email;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ConfirmEmailCubit(
        di<ConfirmEmailRepo>(),
      )..init(email: email),
      child: const Scaffold(
        body: ConfirmEmailBody(),
      ),
    );
  }
}
