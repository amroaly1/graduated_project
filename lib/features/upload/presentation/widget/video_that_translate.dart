import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduate_project/core/dependency_injection/di.dart';
import 'package:graduate_project/core/resource/device_height_width_manager.dart';
import 'package:graduate_project/core/resource/distance_manager.dart';
import 'package:graduate_project/core/resource/string_manager.dart';
import 'package:graduate_project/core/resource/text_style_manager.dart';
import 'package:graduate_project/features/upload/manager/upload_cubit/upload_cubit.dart';
import 'package:graduate_project/features/upload/manager/upload_cubit/upload_state.dart';
import 'package:video_player/video_player.dart';

class VideoThatTranslate extends StatelessWidget {
  const VideoThatTranslate({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: di<UploadCubit>(),
      child: BlocBuilder<UploadCubit, UploadState>(
        builder: (context, state) {
          return Column(
            children: [
              Container(
                width: double.infinity,
                // height: HeightManager.h319,
                height: DeviceHeightWidthManager.subOfHeight(
                  context,
                  HeightOfDesign.h319,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(RaduisValueManager.r10),
                ),
                clipBehavior: Clip.antiAlias,
                child: VideoPlayer(UploadCubit.get(context).controller!),
              ),
              SizedBox(height: HeightManager.h15),
              Padding(
                padding: EdgeInsets.only(left: WidthManager.w12),
                child: Column(
                  children: [
                    Row(
                      spacing: WidthManager.w6,
                      children: [
                        Text(
                          StringManager.filename,
                          style: TextStyleManager.bold14(),
                        ),
                        Expanded(
                          child: Text(
                            UploadCubit.get(context).nameofvideo(),
                            style: TextStyleManager.light13(),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      spacing: WidthManager.w6,
                      children: [
                        Text(
                          StringManager.duration,
                          style: TextStyleManager.bold14(),
                        ),
                        Text(
                          UploadCubit.get(context).durationofVideo(),
                          style: TextStyleManager.light13(),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
