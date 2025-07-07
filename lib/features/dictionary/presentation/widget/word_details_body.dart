import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graduate_project/core/helper/show_snack_bar.dart';
import 'package:graduate_project/core/resource/color_manager.dart';
import 'package:graduate_project/core/resource/device_height_width_manager.dart';
import 'package:graduate_project/core/resource/distance_manager.dart';
import 'package:graduate_project/core/resource/icon_manager.dart';
import 'package:graduate_project/core/resource/padding_manager.dart';
import 'package:graduate_project/core/resource/string_manager.dart';
import 'package:graduate_project/core/resource/text_style_manager.dart';
import 'package:graduate_project/core/route/navigation_manager.dart';
import 'package:graduate_project/core/route/screen_manager.dart';
import 'package:graduate_project/core/widget/cutsom_app_bar_of_sub_page.dart';
import 'package:graduate_project/features/dictionary/data/model/dictionary_item_model.dart';
import 'package:graduate_project/features/dictionary/data/model/resentaly_serach_model.dart';
import 'package:graduate_project/features/dictionary/manager/show_word/show_word_cubit.dart';
import 'package:redacted/redacted.dart';
import 'package:video_player/video_player.dart';

class WordDetailsBody extends StatelessWidget {
  const WordDetailsBody({super.key, required this.word});
  final DictionaryItemModel word;

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
                      Column(
                        children: [
                          InkWell(
                            onTap: () {},
                            // icon: SvgPicture.asset(
                            //   IconManager.share,
                            //   width: WidthManager.w48,
                            //   height: HeightManager.h37,
                            //   fit: BoxFit.fill,
                            //   colorFilter: ColorFilter.mode(
                            //       ColorManager.primaryColor, BlendMode.srcIn),
                            // ),
                            child: Icon(
                              Icons.share_outlined,
                              size: HeightManager.h40,
                              color: ColorManager.primaryColor,
                            ),
                          ),
                          Text(
                            StringManager.share,
                            style: TextStyleManager.medium20(
                              color: ColorManager.primaryColor,
                            ),
                          ),
                        ],
                      ),
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
                      Column(
                        children: [
                          BlocBuilder<ShowWordCubit, ShowWordState>(
                            builder: (context, state) {
                              return InkWell(
                                onTap: () => ShowWordCubit.get(context)
                                    .changeFavorite(word.id),
                                // icon: SvgPicture.asset(
                                //   IconManager.save,
                                //   width: WidthManager.w48,
                                //   height: HeightManager.h37,
                                //   fit: BoxFit.fill,
                                //   colorFilter: ColorFilter.mode(
                                //       ColorManager.primaryColor, BlendMode.srcIn),
                                // ),
                                child: Icon(
                                  ShowWordCubit.get(context).isFavorite
                                      ? Icons.bookmark
                                      : Icons.bookmark_outline_outlined,
                                  size: HeightManager.h40,
                                  color: ColorManager.primaryColor,
                                ),
                              );
                            },
                          ),
                          Text(
                            StringManager.save,
                            style: TextStyleManager.medium20(
                              color: ColorManager.primaryColor,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: HeightManager.h20),
                  Text(
                    StringManager.recentsearches,
                    style: TextStyleManager.medium24(),
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
            ),
          ),
          BlocConsumer<ShowWordCubit, ShowWordState>(
            listener: (context, state) {
              if (state is ShowWordGetResentalySeachFailing) {
                showSnackBar(context, message: state.errMessage);
              }
            },
            builder: (context, state) {
              return SliverList.builder(
                itemCount: ShowWordCubit.get(context).resentSearch.length,
                itemBuilder: (context, index) => ResentlySearchItem(
                  item: ShowWordCubit.get(context).resentSearch[index],
                ),
              );
            },
          ),
          SliverToBoxAdapter(
              child: SizedBox(
            height: HeightManager.h10,
          ))
        ],
      ),
    );
  }
}

class ResentlySearchItem extends StatelessWidget {
  const ResentlySearchItem({
    super.key,
    required this.item,
  });
  final ResentalySerachModel item;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: HeightManager.h6, horizontal: WidthManager.w24),
      child: ListTile(
        onTap: () {
          NavigationManager.pushReplace(
              context: context,
              screen: ScreenManager.worddetailsview,
              arguments: item.matchedResult);
        },
        tileColor: ColorManager.whight,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            RaduisValueManager.r18,
          ),
        ),
        contentPadding: EdgeInsets.symmetric(
          vertical: 0,
          horizontal: WidthManager.w14,
        ),
        title: Text(
          item.matchedResult.gloss,
          style: TextStyleManager.semiBold16(),
        ),
        trailing: InkWell(
          onTap: () =>
              ShowWordCubit.get(context).deleteResentlySearchItem(item.id),
          child: Padding(
            padding: EdgeInsets.only(right: WidthManager.w6),
            child: SvgPicture.asset(
              IconManager.deleteicon,
            ),
          ),
        ),
      ),
    );
  }
}
