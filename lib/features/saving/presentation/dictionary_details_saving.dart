import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduate_project/core/dependency_injection/di.dart';
import 'package:graduate_project/core/resource/color_manager.dart';
import 'package:graduate_project/core/resource/device_height_width_manager.dart';
import 'package:graduate_project/core/resource/distance_manager.dart';
import 'package:graduate_project/core/resource/padding_manager.dart';
import 'package:graduate_project/core/resource/string_manager.dart';
import 'package:graduate_project/core/resource/text_style_manager.dart';
import 'package:graduate_project/core/widget/cutsom_app_bar_of_sub_page.dart';
import 'package:graduate_project/features/dictionary/data/repo/dictionary_add_favorite_repo.dart';
import 'package:graduate_project/features/dictionary/data/repo/dictionary_word_repo.dart';
import 'package:graduate_project/features/dictionary/manager/show_word/show_word_cubit.dart';
import 'package:graduate_project/features/saving/data/model/dictionary_saving_model.dart';
import 'package:redacted/redacted.dart';
import 'package:video_player/video_player.dart';

class DictionaryDetailsSaving extends StatelessWidget {
  const DictionaryDetailsSaving({super.key, required this.word});
  final DictionarySavingModel word;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ShowWordCubit(
        isFavorite: true,
        favoriteRepo: di<DictionaryAddFavoriteRepo>(),
        repo: di<DictionaryWordRepo>(),
      )..initial(url: word.videoUrl),
      child: Scaffold(
        body: DictionaryDetailsSavingBody(
          word: word,
        ),
      ),
    );
  }
}

class DictionaryDetailsSavingBody extends StatelessWidget {
  const DictionaryDetailsSavingBody({super.key, required this.word});
  final DictionarySavingModel word;

  @override
  Widget build(BuildContext context) {
    log("Video Url : ${word.videoUrl.toString()}");
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: CutsomAppBarOfSubPage()),
          SliverToBoxAdapter(
            child: Padding(
              padding: PaddingManager.paddingHorizontal16,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: HeightManager.h7),
                  Text(
                    word.gloss,
                    style: TextStyleManager.medium32(),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: HeightManager.h10),
                  BlocBuilder<ShowWordCubit, ShowWordState>(
                    builder: (context, state) {
                      return Column(
                        children: [
                          ShowWordCubit.get(context).isInitilalVideoInitilal()
                              ? ConstrainedBox(
                                  constraints: BoxConstraints(
                                    maxHeight:
                                        DeviceHeightWidthManager.subOfHeight(
                                            context, HeightManager.h317),
                                    minHeight:
                                        DeviceHeightWidthManager.subOfHeight(
                                            context, HeightManager.h317),
                                    maxWidth: double.infinity,
                                  ),
                                  child: AspectRatio(
                                    aspectRatio: ShowWordCubit.get(context)
                                        .videoController
                                        .value
                                        .aspectRatio,
                                    child: VideoPlayer(
                                      ShowWordCubit.get(context)
                                          .videoController,
                                    ),
                                  ),
                                )
                              : Container(
                                  height: DeviceHeightWidthManager.subOfHeight(
                                      context, HeightManager.h317),
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.zero,
                                  ),
                                ).redacted(
                                  context: context,
                                  redact: true,
                                  configuration: RedactedConfiguration(
                                    animationDuration: const Duration(
                                        milliseconds: 800), //default
                                  ),
                                ),
                        ],
                      );
                    },
                  ),
                  SizedBox(height: HeightManager.h26),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // Column(
                      //   children: [
                      //     InkWell(
                      //       onTap: () {},
                      //       // icon: SvgPicture.asset(
                      //       //   IconManager.share,
                      //       //   width: WidthManager.w48,
                      //       //   height: HeightManager.h37,
                      //       //   fit: BoxFit.fill,
                      //       //   colorFilter: ColorFilter.mode(
                      //       //       ColorManager.primaryColor, BlendMode.srcIn),
                      //       // ),
                      //       child: Icon(
                      //         Icons.share_outlined,
                      //         size: HeightManager.h40,
                      //         color: ColorManager.primaryColor,
                      //       ),
                      //     ),
                      //     Text(
                      //       StringManager.share,
                      //       style: TextStyleManager.medium20(
                      //         color: ColorManager.primaryColor,
                      //       ),
                      //     ),
                      //   ],
                      // ),
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
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
