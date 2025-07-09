import 'dart:developer';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graduate_project/core/dependency_injection/di.dart';
import 'package:graduate_project/core/resource/color_manager.dart';
import 'package:graduate_project/core/resource/device_height_width_manager.dart';
import 'package:graduate_project/core/resource/distance_manager.dart';
import 'package:graduate_project/core/resource/icon_manager.dart';
import 'package:graduate_project/core/resource/padding_manager.dart';
import 'package:graduate_project/core/resource/string_manager.dart';
import 'package:graduate_project/core/resource/text_style_manager.dart';
import 'package:graduate_project/features/translate/data/model/video_to_audio_model.dart';
import 'package:graduate_project/features/translate/manager/audio_player_cubit/audio_player_cubit.dart';
import 'package:graduate_project/features/translate/manager/saving_video_cubit/saving_video_cubit.dart';

class BodySectionOfTransalteToAudio extends StatelessWidget {
  const BodySectionOfTransalteToAudio(
      {super.key, required this.videoToAudioModel});
  final VideoToAudioModel videoToAudioModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: PaddingManager.paddingHorizontal16,
      child: DottedBorder(
        borderType: BorderType.RRect,
        radius: Radius.circular(20),
        dashPattern: [10, 10],
        color: Colors.grey,
        strokeWidth: 2,
        child: Container(
          height: DeviceHeightWidthManager.subOfHeight(
            context,
            HeightOfDesign.h240,
          ),
          width: double.infinity,
          decoration: BoxDecoration(
            color: ColorManager.whight4,
            borderRadius: BorderRadius.circular(
              RaduisValueManager.r15,
            ),
          ),
          child: BlocProvider.value(
            value: di<AudioPlayerCubit>()
              ..init(url: videoToAudioModel.audioUrl
                  // url: "https://server6.mp3quran.net/akdr/001.mp3",
                  ),
            child: BlocBuilder<AudioPlayerCubit, AudioPlayerState>(
              builder: (context, state) {
                log(videoToAudioModel.audioUrl);
                if (state is AudioPlayerInitialFailing) {
                  Center(
                    child: Text(
                      "Unable to load audio: ${state.errMessage}",
                    ),
                  );
                } else if (state is AudioPlayerInitialLoading) {
                  Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomSlider(),
                    SizedBox(
                      height: HeightManager.h24,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            SvgPicture.asset(
                              IconManager.share,
                            ),
                            Text(
                              StringManager.save,
                              style: TextStyleManager.light8(),
                            ),
                          ],
                        ),
                        InkWell(
                          onTap: () {
                            AudioPlayerCubit.get(context).skipBackward();
                          },
                          child: SvgPicture.asset(
                            IconManager.backward10,
                            height: HeightManager.h24,
                          ),
                        ),
                        InkWell(
                          onTap: AudioPlayerCubit.get(context).onTap,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(RaduisValueManager.r8),
                              color: ColorManager.primaryColor,
                            ),
                            child: Icon(
                              AudioPlayerCubit.get(context).isPlaying()
                                  ? Icons.pause
                                  : Icons.play_arrow,
                              color: ColorManager.whight,
                              size: HeightManager.h32,
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            AudioPlayerCubit.get(context).skipForward();
                          },
                          child: SvgPicture.asset(
                            IconManager.forward10,
                            height: HeightManager.h24,
                          ),
                        ),
                        BlocProvider.value(
                          value: di<SavingVideoCubit>()..init(),
                          child:
                              BlocConsumer<SavingVideoCubit, SavingVideoState>(
                            listener: (context, state) {
                              if (state is SavingVideoErrorState) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text(state.errMessage)));
                              }
                            },
                            builder: (context, state) {
                              return InkWell(
                                onTap: () => SavingVideoCubit.get(context)
                                    .onTap(
                                        trsnlationid:
                                            videoToAudioModel.translationId,
                                        returnaudio: true),
                                child: Column(
                                  children: [
                                    Icon(
                                      SavingVideoCubit.get(context).isSaved
                                          ? Icons.bookmark
                                          : Icons.bookmark_border_outlined,
                                      color: ColorManager.primaryColor,
                                    ),
                                    Text(
                                      StringManager.save,
                                      style: TextStyleManager.light8(),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class CustomSlider extends StatefulWidget {
  const CustomSlider({
    super.key,
  });

  @override
  State<CustomSlider> createState() => _CustomSliderState();
}

class _CustomSliderState extends State<CustomSlider> {
  double max = 100;
  double value = 0;
  Duration valueDuration = Duration();

  @override
  void initState() {
    intit();
    super.initState();
  }

  intit() async {
    AudioPlayerCubit.get(context).listenToStreamPosition((onData) {
      setState(() {
        value = onData.inSeconds.toDouble();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: WidthManager.w13),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Slider(
            min: 0,
            max: AudioPlayerCubit.get(context).maxDuration,
            value: value,
            onChanged: (value) {
              final pos = Duration(seconds: value.toInt());

              AudioPlayerCubit.get(context).seeckTo(pos);
            },
          ),
          Positioned(
            bottom: -10,
            left: 15,
            child: Text(
              Duration(seconds: value.toInt()).toString().split(".")[0],
              style: TextStyleManager.light8(),
            ),
          ),
          Positioned(
            bottom: -10,
            right: 15,
            child: Text(
              Duration(
                      seconds:
                          AudioPlayerCubit.get(context).maxDuration.toInt())
                  .toString()
                  .split(".")[0],
              style: TextStyleManager.light8(),
            ),
          ),
        ],
      ),
    );
  }
}
