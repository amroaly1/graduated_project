import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduate_project/features/upload/manager/cubit/upload_cubit.dart';
import 'package:graduate_project/features/upload/presentation/widget/translate_video_body.dart';

class TranslateVideoView extends StatelessWidget {
  const TranslateVideoView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: UploadCubit(),
      child: const Scaffold(
        body: TranslateVideoBody(),
      ),
    );
  }
}
