import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduate_project/core/dependency_injection/di.dart';
import 'package:graduate_project/features/profile/manager/edit_profile_cubit/edit_profile_cubit.dart';
import 'package:graduate_project/features/profile/presentation/widget/edit_profile_body_view.dart';

class EditProfileView extends StatelessWidget {
  const EditProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: di<EditProfileCubit>()..init(),
      child: const Scaffold(
        body: EditProfileBodyView(),
      ),
    );
  }
}
