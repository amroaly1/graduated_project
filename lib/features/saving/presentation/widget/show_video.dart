import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduate_project/core/dependency_injection/di.dart';
import 'package:graduate_project/core/resource/color_manager.dart';
import 'package:graduate_project/core/resource/device_height_width_manager.dart';
import 'package:graduate_project/core/resource/distance_manager.dart';
import 'package:graduate_project/core/resource/string_manager.dart';
import 'package:graduate_project/core/resource/text_style_manager.dart';
import 'package:graduate_project/features/dictionary/data/repo/dictionary_add_favorite_repo.dart';
import 'package:graduate_project/features/dictionary/data/repo/dictionary_word_repo.dart';
import 'package:graduate_project/features/dictionary/manager/show_word/show_word_cubit.dart';
import 'package:redacted/redacted.dart';
import 'package:video_player/video_player.dart';

class ShowVideo extends StatelessWidget {
  const ShowVideo({super.key, required this.url});

  final String url;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ShowWordCubit(
        isFavorite: true,
        favoriteRepo: di<DictionaryAddFavoriteRepo>(),
        repo: di<DictionaryWordRepo>(),
      )..initial(url: url),
      child: BlocBuilder<ShowWordCubit, ShowWordState>(
        builder: (context, state) {
          return Column(
            children: [
              ShowWordCubit.get(context).isInitilalVideoInitilal()
                  ? ConstrainedBox(
                      constraints: BoxConstraints(
                        maxHeight: DeviceHeightWidthManager.subOfHeight(
                            context, HeightManager.h280),
                        minHeight: DeviceHeightWidthManager.subOfHeight(
                            context, HeightManager.h280),
                        maxWidth: double.infinity,
                      ),
                      child: AspectRatio(
                        aspectRatio: ShowWordCubit.get(context)
                            .videoController
                            .value
                            .aspectRatio,
                        child: VideoPlayer(
                          ShowWordCubit.get(context).videoController,
                        ),
                      ),
                    )
                  : Container(
                      height: DeviceHeightWidthManager.subOfHeight(
                          context, HeightManager.h280),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.zero,
                      ),
                    ).redacted(
                      context: context,
                      redact: true,
                      configuration: RedactedConfiguration(
                        animationDuration:
                            const Duration(milliseconds: 800), //default
                      ),
                    ),
              SizedBox(height: HeightManager.h20),
              BlocBuilder<ShowWordCubit, ShowWordState>(
                builder: (context, state) {
                  return Column(
                    children: [
                      InkWell(
                        onTap: () {
                          ShowWordCubit.get(context).changePlayOrStop();
                        },
                        child: Icon(
                          ShowWordCubit.get(context).isVideoPlay()
                              ? Icons.pause_circle
                              : Icons.play_circle,
                          size: HeightManager.h40,
                          color: ColorManager.primaryColor,
                        ),
                      ),
                      Text(
                        ShowWordCubit.get(context).isVideoPlay()
                            ? StringManager.play
                            : StringManager.pause,
                        style: TextStyleManager.medium20(
                          color: ColorManager.primaryColor,
                        ),
                      ),
                    ],
                  );
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
