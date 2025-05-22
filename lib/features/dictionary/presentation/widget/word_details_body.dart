import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduate_project/core/resource/color_manager.dart';
import 'package:graduate_project/core/resource/device_height_width_manager.dart';
import 'package:graduate_project/core/resource/distance_manager.dart';
import 'package:graduate_project/core/resource/padding_manager.dart';
import 'package:graduate_project/core/resource/string_manager.dart';
import 'package:graduate_project/core/resource/text_style_manager.dart';
import 'package:graduate_project/core/widget/cutsom_app_bar_of_sub_page.dart';
import 'package:graduate_project/features/dictionary/data/model/dictionary_item_model.dart';
import 'package:graduate_project/features/dictionary/manager/show_word/show_word_cubit.dart';
import 'package:redacted/redacted.dart';
import 'package:video_player/video_player.dart';

class WordDetailsBody extends StatelessWidget {
  const WordDetailsBody({super.key, required this.word});
  final DictionaryItemModel word;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          CutsomAppBarOfSubPage(),
          Padding(
            padding: PaddingManager.paddingHorizontal24,
            child: Column(
              children: [
                SizedBox(height: HeightManager.h100),
                BlocBuilder<ShowWordCubit, ShowWordState>(
                  builder: (context, state) {
                    return Column(
                      children: [
                        ShowWordCubit.get(context).isInitilalVideoInitilal()
                            ? AspectRatio(
                                aspectRatio: ShowWordCubit.get(context)
                                    .videoController
                                    .value
                                    .aspectRatio,
                                child: VideoPlayer(
                                  ShowWordCubit.get(context).videoController,
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
                SizedBox(height: HeightManager.h32),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        IconButton(
                          onPressed: () {},
                          // icon: SvgPicture.asset(
                          //   IconManager.share,
                          //   width: WidthManager.w48,
                          //   height: HeightManager.h37,
                          //   fit: BoxFit.fill,
                          //   colorFilter: ColorFilter.mode(
                          //       ColorManager.primaryColor, BlendMode.srcIn),
                          // ),
                          icon: Icon(Icons.share_outlined,
                              size: HeightManager.h44,
                              color: ColorManager.primaryColor),
                        ),
                        Text(
                          StringManager.share,
                          style: TextStyleManager.medium20(),
                        ),
                      ],
                    ),
                    BlocBuilder<ShowWordCubit, ShowWordState>(
                      builder: (context, state) {
                        return Column(
                          children: [
                            IconButton(
                              onPressed: () {
                                ShowWordCubit.get(context).changePlayOrStop();
                              },
                              icon: Icon(
                                ShowWordCubit.get(context).isVideoPlay()
                                    ? Icons.pause_circle
                                    : Icons.play_circle,
                                size: HeightManager.h49,
                                color: ColorManager.primaryColor,
                              ),
                            ),
                            Text(
                              ShowWordCubit.get(context).isVideoPlay()
                                  ? StringManager.play
                                  : StringManager.pause,
                              style: TextStyleManager.medium20(),
                            ),
                          ],
                        );
                      },
                    ),
                    Column(
                      children: [
                        BlocBuilder<ShowWordCubit, ShowWordState>(
                          builder: (context, state) {
                            return IconButton(
                              onPressed: () => ShowWordCubit.get(context)
                                  .changeFavorite(word.id),
                              // icon: SvgPicture.asset(
                              //   IconManager.save,
                              //   width: WidthManager.w48,
                              //   height: HeightManager.h37,
                              //   fit: BoxFit.fill,
                              //   colorFilter: ColorFilter.mode(
                              //       ColorManager.primaryColor, BlendMode.srcIn),
                              // ),
                              icon: Icon(
                                  word.isFavorite
                                      ? Icons.bookmark
                                      : Icons.bookmark_outline_outlined,
                                  size: HeightManager.h49,
                                  color: ColorManager.primaryColor),
                            );
                          },
                        ),
                        Text(
                          StringManager.save,
                          style: TextStyleManager.medium20(),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
