import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduate_project/features/onboarding/manager/on_boarding_cubit/on_boarding_cubit.dart';
import 'package:graduate_project/features/onboarding/view/widget/on_boarding_body.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OnBoardingCubit()..init(),
      child: PopScope(
        canPop: false,
        child: const Scaffold(
          body: OnBoardingBody(),
        ),
      ),
    );
  }
}
