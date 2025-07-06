import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduate_project/core/dependency_injection/di.dart';
import 'package:graduate_project/core/helper/show_snack_bar.dart';
import 'package:graduate_project/core/resource/color_manager.dart';
import 'package:graduate_project/core/resource/distance_manager.dart';
import 'package:graduate_project/core/resource/padding_manager.dart';
import 'package:graduate_project/core/resource/string_manager.dart';
import 'package:graduate_project/core/resource/text_style_manager.dart';
import 'package:graduate_project/core/route/navigation_manager.dart';
import 'package:graduate_project/core/route/screen_manager.dart';
import 'package:graduate_project/core/widget/cutsom_app_bar_of_sub_page.dart';
import 'package:graduate_project/core/widget/default_button.dart';
import 'package:graduate_project/features/upload/manager/upload_video_cubit.dart/upload_video_cubit.dart';
import 'package:graduate_project/features/upload/manager/upload_cubit/upload_cubit.dart';
import 'package:graduate_project/features/upload/presentation/widget/model_bottom_sheet_card.dart';
import 'package:graduate_project/features/upload/presentation/widget/video_that_translate.dart';

class TranslateVideoBody extends StatelessWidget {
  const TranslateVideoBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CutsomAppBarOfSubPage(),
          SizedBox(height: HeightManager.h29),
          Padding(
            padding: PaddingManager.paddingHorizontal24,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  StringManager.uploadvideo,
                  style: TextStyleManager.bold24(),
                ),
                SizedBox(
                  height: HeightManager.h29,
                ),
                VideoThatTranslate(),
              ],
            ),
          ),
          SizedBox(height: HeightManager.h40),
          DefaultButton(
            text: StringManager.translate,
            onPressed: () {
              modelBottomSheetTranslateVideo(
                context: context,
              );
            },
          ),
          SizedBox(height: HeightManager.h10),
          DefaultButton(
            text: StringManager.cancel,
            onPressed: () {
              NavigationManager.pop(context: context);
            },
          ),
        ],
      ),
    );
  }

  Future<dynamic> modelBottomSheetTranslateVideo({
    required BuildContext context,
  }) {
    return showModalBottomSheet(
        context: context,
        isScrollControlled: false,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(RaduisValueManager.r30),
            topRight: Radius.circular(RaduisValueManager.r30),
          ),
        ),
        builder: (context) {
          return Wrap(
            children: [
              BlocProvider.value(
                value: di<UploadVideoCubit>(),
                child: Column(
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          height: HeightManager.h6,
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Container(
                            width: WidthManager.w70,
                            height: HeightManager.h6,
                            decoration: BoxDecoration(
                              color: ColorManager.gray4,
                            ),
                          ),
                        ),
                      ],
                    ),
                    BlocConsumer<UploadVideoCubit, UploadVideoState>(
                      listener: (context, state) {
                        if (state is UploadVideoSuccessState) {
                          if (state.isAudio == false) {
                            NavigationManager.pop(context: context);
                            NavigationManager.pushReplace(
                              context: context,
                              screen: ScreenManager.translateToTextView,
                              arguments: state.videoToTextModel,
                            );
                          } else {
                            NavigationManager.pop(context: context);
                            NavigationManager.pushReplace(
                              context: context,
                              screen: ScreenManager.translateToAudioView,
                              arguments: state.videoToAudioModel,
                            );
                          }
                        }
                        if (state is UploadVideoLoadingState) {
                          // NavigationManager.pop(context: context);
                          log("Loading::::::::");
                        }
                        if (state is UploadVideoErrorState) {
                          showSnackBar(context, message: state.errMessage);
                        }
                      },
                      builder: (context, state) {
                        return Padding(
                          padding: PaddingManager.paddingHorizontal24,
                          child: Column(
                            spacing: HeightManager.h15,
                            children: [
                              SizedBox(
                                height: HeightManager.h16,
                              ),
                              (state is UploadVideoLoadingState &&
                                      UploadVideoCubit.get(context).isAudio ==
                                          false)
                                  ? Center(
                                      child: CircularProgressIndicator(),
                                    )
                                  : ModelBottomSheetCard(
                                      title: StringManager.translatetoText,
                                      onTap: () => UploadVideoCubit.get(context)
                                          .uploadVideo(
                                        video: di<UploadCubit>().video!,
                                        returnaudio: false,
                                      ),
                                    ),
                              (state is UploadVideoLoadingState &&
                                      UploadVideoCubit.get(context).isAudio ==
                                          true)
                                  ? Center(
                                      child: CircularProgressIndicator(),
                                    )
                                  : ModelBottomSheetCard(
                                      title: StringManager.translatetoAudio,
                                      onTap: () => UploadVideoCubit.get(context)
                                          .uploadVideo(
                                        video: di<UploadCubit>().video!,
                                        returnaudio: true,
                                      ),
                                    ),
                              SizedBox(
                                height: HeightManager.h20,
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          );
        });
  }
}
