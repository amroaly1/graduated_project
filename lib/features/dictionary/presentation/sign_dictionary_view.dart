import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduate_project/core/dependency_injection/di.dart';
import 'package:graduate_project/features/dictionary/manager/sign_dictionary/sign_dictionary_cubit.dart';
import 'package:graduate_project/features/dictionary/presentation/widget/sign_dictionary_body.dart';

class SignDictionaryView extends StatelessWidget {
  const SignDictionaryView({super.key});

  @override
  Widget build(BuildContext context) {
    log("Call SignDictionaryView");
    return BlocProvider.value(
      value: di<SignDictionaryCubit>()..inital(),
      child: const Scaffold(
        body: SignDictionaryBody(),
      ),
    );
  }
}

// BlocProvider.value(value: di<SignDictionaryCubit>()),
