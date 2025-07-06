import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduate_project/core/dependency_injection/di.dart';
import 'package:graduate_project/features/saving/manager/saving_cubit/saving_cubit.dart';
import 'package:graduate_project/features/saving/presentation/widget/saving_body_view.dart';

class SavingView extends StatelessWidget {
  const SavingView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: di<SavingCubit>()..init(),
      child: const Scaffold(
        body: SavingBodyView(),
      ),
    );
  }
}
