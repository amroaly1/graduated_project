import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduate_project/core/resource/device_height_width_manager.dart';
import 'package:graduate_project/core/resource/distance_manager.dart';
import 'package:graduate_project/core/resource/padding_manager.dart';
import 'package:graduate_project/core/resource/string_manager.dart';
import 'package:graduate_project/core/resource/text_style_manager.dart';
import 'package:graduate_project/core/route/navigation_manager.dart';

import 'package:graduate_project/core/widget/cutsom_app_bar_of_sub_page.dart';
import 'package:graduate_project/core/widget/default_button.dart';
import 'package:graduate_project/features/upload/manager/cubit/upload_cubit.dart';
import 'package:graduate_project/features/upload/manager/cubit/upload_state.dart';
import 'package:video_player/video_player.dart';

class TranslateVideoBody extends StatelessWidget {
  const TranslateVideoBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UploadCubit, UploadState>(
      builder: (context, state) {
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
                    Container(
                      width: double.infinity,
                      // height: HeightManager.h319,
                      height: DeviceHeightWidthManager.subOfHeight(
                        context,
                        HeightOfDesign.h319,
                      ),
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(RaduisValueManager.r10),
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
                ),
              ),
              SizedBox(height: HeightManager.h40),
              DefaultButton(
                text: StringManager.chat,
                onPressed: () {},
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
      },
    );
  }
}
