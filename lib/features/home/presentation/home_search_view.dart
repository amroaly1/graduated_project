import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduate_project/core/dependency_injection/di.dart';
import 'package:graduate_project/core/helper/get_video_thumbnail.dart';
import 'package:graduate_project/core/resource/color_manager.dart';
import 'package:graduate_project/core/resource/distance_manager.dart';
import 'package:graduate_project/core/resource/padding_manager.dart';
import 'package:graduate_project/core/resource/text_style_manager.dart';
import 'package:graduate_project/core/widget/cutsom_app_bar_of_sub_page.dart';
import 'package:graduate_project/features/home/data/repo/home_search_repo.dart';
import 'package:graduate_project/features/home/manager/home_search_cubit/home_search_cubit.dart';
import 'package:graduate_project/features/home/presentation/widget/custom_search_home_text_field.dart';
import 'package:graduate_project/features/saving/data/model/translation_saving_model.dart';
import 'package:graduate_project/features/saving/data/model/video_to_audio_save_model.dart';
import 'package:graduate_project/features/saving/data/model/video_to_text_save_model.dart';
import 'package:graduate_project/features/saving/presentation/video_to_audio_detials.dart';
import 'package:graduate_project/features/saving/presentation/video_to_text_details.dart';
import 'package:graduate_project/features/saving/presentation/widget/custom_card_of_translation.dart';

import 'package:graduate_project/features/saving/presentation/widget/custom_failing_body.dart';
import 'package:graduate_project/features/saving/presentation/widget/custom_loading_body.dart';
import 'package:intl/intl.dart';
import 'package:redacted/redacted.dart';

class HomeSearchView extends StatelessWidget {
  const HomeSearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeSearchCubit(
        di<HomeSearchRepo>(),
      ),
      child: const Scaffold(
        body: HomeSearchBody(),
      ),
    );
  }
}

class HomeSearchBody extends StatelessWidget {
  const HomeSearchBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      children: [
        CutsomAppBarOfSubPage(),
        SizedBox(
          height: HeightManager.h20,
        ),
        CustomSearchHomeTextField(
          autofocus: true,
          onSubmitted: (value) {
            if (value.isNotEmpty) {
              HomeSearchCubit.get(context).getSearchResult(value);
            }
          },
        ),
        SizedBox(
          height: HeightManager.h20,
        ),
        Expanded(child: BodyOfSearch()),
      ],
    ));
  }
}

class BodyOfSearch extends StatelessWidget {
  const BodyOfSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeSearchCubit, HomeSearchState>(
      builder: (context, state) {
        if (state is HomeSearchInitial) {
          return Center(
            child: Text(
              "Search for any word",
              textAlign: TextAlign.center,
            ),
          );
        }
        if (state is HomeSearchErrorState) {
          return Padding(
            padding: PaddingManager.paddingHorizontal16,
            child: CustomFailingBody(error: state.errMessage),
          );
        } else if (state is HomeSearchLoadingState) {
          return Padding(
            padding: PaddingManager.paddingHorizontal16,
            child: CustomLoadingBody(
              isSaving: false,
            ),
          );
        }
        if (HomeSearchCubit.get(context).searchModel.translations.isEmpty) {
          return Center(
              child: Padding(
            padding: PaddingManager.paddingHorizontal16,
            child: Text("Not found any item"),
          ));
        }
        return Padding(
          padding: PaddingManager.paddingHorizontal16,
          child: ListView.builder(
            itemCount:
                HomeSearchCubit.get(context).searchModel.translations.length,
            itemBuilder: (context, index) {
              if (HomeSearchCubit.get(context)
                          .searchModel
                          .translations[index]
                          .sourceType ==
                      "video-to-text" &&
                  HomeSearchCubit.get(context)
                          .searchModel
                          .translations[index]
                          .audioUrl ==
                      null) {
                return CustomCardOfVideoToText(
                  isSaving: false,
                  item: TranslationsText(
                    id: HomeSearchCubit.get(context)
                        .searchModel
                        .translations[index]
                        .id!
                        .toString(),
                    text: HomeSearchCubit.get(context)
                            .searchModel
                            .translations[index]
                            .text ??
                        "",
                    timestamp: HomeSearchCubit.get(context)
                        .searchModel
                        .translations[index]
                        .timestamp!,
                    filename: HomeSearchCubit.get(context)
                        .searchModel
                        .translations[index]
                        .filename!,
                    videoUrl: HomeSearchCubit.get(context)
                        .searchModel
                        .translations[index]
                        .videoUrl!,
                    thumbnailUrl: HomeSearchCubit.get(context)
                            .searchModel
                            .translations[index]
                            .thumbnailUrl ??
                        "",
                  ),
                );
              } else if (HomeSearchCubit.get(context)
                          .searchModel
                          .translations[index]
                          .sourceType ==
                      "video-to-text" &&
                  HomeSearchCubit.get(context)
                          .searchModel
                          .translations[index]
                          .audioUrl !=
                      null) {
                return CustomCardOfVideoToAudio(
                    isSaving: false,
                    item: TranslationsAudio(
                      text: HomeSearchCubit.get(context)
                          .searchModel
                          .translations[index]
                          .text!,
                      id: HomeSearchCubit.get(context)
                          .searchModel
                          .translations[index]
                          .id!
                          .toString(),
                      audioUrl: HomeSearchCubit.get(context)
                          .searchModel
                          .translations[index]
                          .audioUrl!,
                      timestamp: HomeSearchCubit.get(context)
                          .searchModel
                          .translations[index]
                          .timestamp!,
                      filename: HomeSearchCubit.get(context)
                          .searchModel
                          .translations[index]
                          .filename!,
                      videoUrl: HomeSearchCubit.get(context)
                          .searchModel
                          .translations[index]
                          .videoUrl!,
                      thumbnailUrl: HomeSearchCubit.get(context)
                              .searchModel
                              .translations[index]
                              .thumbnailUrl ??
                          "",
                    ));
              } else if (HomeSearchCubit.get(context)
                      .searchModel
                      .translations[index]
                      .img !=
                  null) {
                return CustomCardOfTranslation(
                  isSaving: false,
                  item: TranslationsTranslate(
                    hasThumbnail: HomeSearchCubit.get(context)
                        .searchModel
                        .translations[index]
                        .hasThumbnail!,
                    hasAudio: HomeSearchCubit.get(context)
                        .searchModel
                        .translations[index]
                        .hasAudio!,
                    audioUrl: HomeSearchCubit.get(context)
                        .searchModel
                        .translations[index]
                        .audioUrl,
                    savedAt: HomeSearchCubit.get(context)
                        .searchModel
                        .translations[index]
                        .savedAt!,
                    img: HomeSearchCubit.get(context)
                        .searchModel
                        .translations[index]
                        .img!,
                    words: HomeSearchCubit.get(context)
                        .searchModel
                        .translations[index]
                        .words!,
                    originalText: HomeSearchCubit.get(context)
                        .searchModel
                        .translations[index]
                        .originalText!,
                    translationId: int.parse(HomeSearchCubit.get(context)
                        .searchModel
                        .translations[index]
                        .translationId!),
                    thumbnailUrl: HomeSearchCubit.get(context)
                            .searchModel
                            .translations[index]
                            .thumbnailUrl ??
                        "",
                  ),
                );
              } else {
                return SizedBox();
              }
            },
          ),
        );
      },
    );
  }
}

class CustomCardOfVideoToAudio extends StatelessWidget {
  const CustomCardOfVideoToAudio({
    super.key,
    required this.item,
    this.isSaving = true,
  });
  final TranslationsAudio item;
  final bool isSaving;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        bottom: HeightManager.h22,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(RaduisValueManager.r8),
        color: ColorManager.whight,
        boxShadow: [
          BoxShadow(
            color: ColorManager.gray,
            blurRadius: 4,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(
          horizontal: WidthManager.w13,
        ),
        leading: FutureBuilder<File?>(
          future: getVideoThumbnail(item.videoUrl),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              // ignore: sized_box_for_whitespace
              return Container(
                width: WidthManager.w70,
                height: HeightManager.h130,
              ).redacted(
                context: context,
                redact: true,
                configuration: RedactedConfiguration(
                  animationDuration:
                      const Duration(milliseconds: 800), //default
                ),
              );
            } else if (snapshot.hasData) {
              return Image.file(
                snapshot.data!,
                width: WidthManager.w70,
                height: HeightManager.h130,
              );
            } else {
              return Text("Failed to generate thumbnail");
            }
          },
        ),
        title: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => VideoToAudioDetails(
                  item: item,
                ),
              ),
            );
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item.filename,
                style: TextStyleManager.medium14(
                  color: ColorManager.black,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
              SizedBox(
                height: HeightManager.h6,
              ),
              Text(
                "${DateFormat('MMMM d, y').format(DateTime.parse(item.timestamp))} - ${DateFormat('h:mm a').format(DateTime.parse(item.timestamp))} ",
                style: TextStyleManager.regular10(
                  color: ColorManager.gray11,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomCardOfVideoToText extends StatelessWidget {
  const CustomCardOfVideoToText({
    super.key,
    required this.item,
    this.isSaving = true,
  });
  final TranslationsText item;
  final bool isSaving;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        bottom: HeightManager.h22,
      ),
      // padding: EdgeInsets.symmetric(
      //   vertical: HeightManager.h15,
      //   horizontal: WidthManager.w13,
      // ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(RaduisValueManager.r8),
        color: ColorManager.whight,
        boxShadow: [
          BoxShadow(
            color: ColorManager.gray,
            blurRadius: 4,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(
          horizontal: WidthManager.w13,
        ),
        leading: FutureBuilder<File?>(
          future: getVideoThumbnail(item.videoUrl),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              // ignore: sized_box_for_whitespace
              return Container(
                width: WidthManager.w70,
                height: HeightManager.h130,
              ).redacted(
                context: context,
                redact: true,
                configuration: RedactedConfiguration(
                  animationDuration:
                      const Duration(milliseconds: 800), //default
                ),
              );
            } else if (snapshot.hasData) {
              return Image.file(
                snapshot.data!,
                width: WidthManager.w70,
                height: HeightManager.h130,
              );
            } else {
              return Text("Failed to generate thumbnail");
            }
          },
        ),
        title: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => VideoToTextDetails(
                  item: item,
                ),
              ),
            );
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item.text,
                style: TextStyleManager.medium16(
                  color: ColorManager.black,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
              SizedBox(
                height: HeightManager.h6,
              ),
              Text(
                "${DateFormat('MMMM d, y').format(DateTime.parse(item.timestamp))} - ${DateFormat('h:mm a').format(DateTime.parse(item.timestamp))} ",
                style: TextStyleManager.regular10(
                  color: ColorManager.gray11,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
