import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduate_project/core/dependency_injection/di.dart';
import 'package:graduate_project/features/saving/manager/cubit/get_all_data_saving_cubit.dart';
import 'package:graduate_project/features/saving/manager/dictionary_saving_cubit/dictionary_saving_cubit.dart';
import 'package:graduate_project/features/saving/manager/saving_cubit/saving_cubit.dart';
import 'package:graduate_project/features/saving/manager/translation_saving/trsanlation_saving_cubit.dart';
import 'package:graduate_project/features/saving/manager/video_to_audio_save/video_to_audio_save_cubit.dart';
import 'package:graduate_project/features/saving/manager/video_to_text_cubit/video_to_text_cubitt.dart';
import 'package:graduate_project/features/saving/presentation/widget/saving_body_view.dart';

class SavingView extends StatelessWidget {
  const SavingView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: di<SavingCubit>()..init()),
        BlocProvider.value(value: di<GetAllDataSavingCubit>()..init()),
        BlocProvider.value(value: di<VideoToTextCubit>()..init()),
        BlocProvider.value(value: di<DictionarySavingCubit>()..init()),
        BlocProvider.value(value: di<TrsanlationSavingCubit>()..init()),
        BlocProvider.value(value: di<VideoToAudioSaveCubit>()..init()),
      ],
      child: const Scaffold(
        body: SavingBodyView(),
      ),
    );
  }
}
