import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduate_project/core/dependency_injection/di.dart';
import 'package:graduate_project/features/saving/manager/video_to_text_cubit/video_to_text_cubitt.dart';
import 'package:graduate_project/features/saving/presentation/widget/custom_card_of_video_to_text.dart';
import 'package:graduate_project/features/saving/presentation/widget/custom_failing_body.dart';
import 'package:graduate_project/features/saving/presentation/widget/custom_loading_body.dart';

class CustomBodyOfVideoToText extends StatelessWidget {
  const CustomBodyOfVideoToText({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: di<VideoToTextCubit>()..init(),
      child: BlocBuilder<VideoToTextCubit, VideoToTextState>(
        builder: (context, state) {
          if (state is VideoToTextFailing) {
            return CustomFailingBody(error: state.errMessage);
          } else if (state is VideoToTextLoading) {
            return CustomLoadingBody();
          }
          return ListView.builder(
            itemCount: VideoToTextCubit.get(context)
                    .videoToTextSaveModel
                    ?.translations
                    .length ??
                0,
            itemBuilder: (context, index) => CustomCardOfVideoToText(
              item: VideoToTextCubit.get(context)
                  .videoToTextSaveModel!
                  .translations[index],
            ),
          );
        },
      ),
    );
  }
}
