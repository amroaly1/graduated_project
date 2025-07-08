import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduate_project/core/dependency_injection/di.dart';
import 'package:graduate_project/core/resource/distance_manager.dart';
import 'package:graduate_project/core/resource/padding_manager.dart';
import 'package:graduate_project/core/resource/string_manager.dart';
import 'package:graduate_project/core/widget/custom_body_no_search_found.dart';
import 'package:graduate_project/core/widget/cutsom_app_bar_of_sub_page.dart';
import 'package:graduate_project/features/home/data/repo/home_search_repo.dart';
import 'package:graduate_project/features/home/manager/home_search_cubit/home_search_cubit.dart';
import 'package:graduate_project/features/home/presentation/widget/custom_card_of_video_to_text.dart';
import 'package:graduate_project/features/home/presentation/widget/custom_crad_to_video_to_audio.dart';
import 'package:graduate_project/features/home/presentation/widget/custom_search_home_text_field.dart';
import 'package:graduate_project/features/saving/data/model/translation_saving_model.dart';
import 'package:graduate_project/features/saving/data/model/video_to_audio_save_model.dart';
import 'package:graduate_project/features/saving/data/model/video_to_text_save_model.dart';
import 'package:graduate_project/features/saving/presentation/widget/custom_card_of_translation.dart';

import 'package:graduate_project/features/saving/presentation/widget/custom_failing_body.dart';
import 'package:graduate_project/features/saving/presentation/widget/custom_loading_body.dart';

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
              StringManager.searchforanyword,
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
          return CutomBodyNoSearchFound();
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
