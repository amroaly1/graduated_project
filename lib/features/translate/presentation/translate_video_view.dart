import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduate_project/core/dependency_injection/di.dart';
import 'package:graduate_project/features/translate/manager/upload_cubit/upload_cubit.dart';
import 'package:graduate_project/features/translate/presentation/widget/translate_video_body.dart';

class TranslateVideoView extends StatelessWidget {
  const TranslateVideoView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: di<UploadCubit>(),
      child: const Scaffold(
        body: TranslateVideoBody(),
      ),
    );
  }
}
