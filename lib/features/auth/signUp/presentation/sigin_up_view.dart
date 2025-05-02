import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduate_project/core/dependency_injection/di.dart';
import 'package:graduate_project/features/auth/signUp/manager/cubit/sigin_up_cubit.dart';
import 'package:graduate_project/features/auth/signUp/presentation/widget/sigin_up_body.dart';

class SiginUpView extends StatelessWidget {
  const SiginUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di<SiginUpCubit>(),
      child: const Scaffold(
        body: SiginUpBody(),
      ),
    );
  }
}
