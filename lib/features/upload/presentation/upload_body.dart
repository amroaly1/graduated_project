import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graduate_project/core/dependency_injection/di.dart';
import 'package:graduate_project/core/resource/color_manager.dart';
import 'package:graduate_project/core/resource/distance_manager.dart';
import 'package:graduate_project/core/resource/image_manager.dart';
import 'package:graduate_project/core/resource/padding_manager.dart';
import 'package:graduate_project/core/resource/string_manager.dart';
import 'package:graduate_project/core/resource/text_style_manager.dart';
import 'package:graduate_project/core/route/navigation_manager.dart';
import 'package:graduate_project/core/route/screen_manager.dart';
import 'package:graduate_project/core/widget/app_bar_of_home_pages.dart';
import 'package:graduate_project/core/widget/default_button.dart';
import 'package:graduate_project/features/upload/manager/upload_cubit/upload_cubit.dart';
import 'package:graduate_project/features/upload/manager/upload_cubit/upload_state.dart';
import 'package:graduate_project/features/upload/presentation/widget/body_of_buttom_sheet.dart';

class UploadBody extends StatelessWidget {
  const UploadBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: di<UploadCubit>(),
      child: Builder(builder: (context) {
        return SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              AppBarOfHomePages(title: StringManager.uploadVideo),
              Padding(
                padding: PaddingManager.paddingHorizontal16,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(height: HeightManager.h20),
                    ListTile(
                      contentPadding: const EdgeInsets.all(0),
                      titleAlignment: ListTileTitleAlignment.top,
                      leading: Container(
                        padding: EdgeInsets.symmetric(
                          vertical: HeightManager.h13,
                          horizontal: WidthManager.w6,
                        ),
                        decoration: BoxDecoration(
                          color: ColorManager.primaryColor,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.videocam,
                          color: ColorManager.whight,
                        ),
                      ),
                      title: Text(
                        StringManager.videos,
                        style: TextStyleManager.medium20(),
                      ),
                      subtitle: Text(
                        StringManager.dateofVideo,
                        style: TextStyleManager.light14(),
                      ),
                    ),
                    SizedBox(height: HeightManager.h34),
                    DottedBorder(
                      borderType: BorderType.RRect,
                      radius: Radius.circular(20),
                      dashPattern: [10, 10],
                      color: Colors.grey,
                      strokeWidth: 2,
                      child: Column(
                        children: [
                          SizedBox(height: HeightManager.h32),
                          SvgPicture.asset(
                            ImageManager.uploadvideoimage,
                            height: HeightManager.h130,
                            width: double.infinity,
                            fit: BoxFit.fill,
                          ),
                          SizedBox(height: HeightManager.h22),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: WidthManager.w48,
                            ),
                            child: Text(
                              StringManager.selectOrCaptureVideo,
                              style: TextStyleManager.medium24(
                                color: ColorManager.black,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          SizedBox(
                            height: HeightManager.h52,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: HeightManager.h34),
              BlocListener<UploadCubit, UploadState>(
                listener: (context, state) {
                  if (state is UploadVideoDone) {
                    NavigationManager.pop(context: context);
                    NavigationManager.push(
                        context: context,
                        screen: ScreenManager.translatevideoView);
                  }
                },
                child: DefaultButton(
                    text: StringManager.selectVideo,
                    onPressed: () {
                      showModalBottomSheet(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(RaduisValueManager.r72),
                            topRight: Radius.circular(RaduisValueManager.r72),
                          ),
                        ),
                        context: context,
                        builder: (context) {
                          return BlocProvider.value(
                            value: di<UploadCubit>(),
                            child: BodyOfBoyyomSheet(),
                          );
                        },
                      );
                    }),
              ),
            ],
          ),
        );
      }),
    );
  }
}



 // return Column(
    //   crossAxisAlignment: CrossAxisAlignment.stretch,
    //   children: [
    //     AppBarOfHomePages(title: StringManager.translate),
    //     Padding(
    //       padding: PaddingManager.paddingHorizontal24,
    //       child: Column(
    //         crossAxisAlignment: CrossAxisAlignment.stretch,
    //         children: [
    //           SizedBox(height: HeightManager.h40),
    //           Image.asset(
    //             ImageManager.translateImage,
    //             width: DeviceHeightWidthManager.subOfWidth(
    //                 context, WidthOfDesign.w364),
    //             height: DeviceHeightWidthManager.subOfHeight(
    //               context,
    //               HeightOfDesign.h294,
    //             ),
    //           ),
    //           SizedBox(height: HeightManager.h12),
    //           Row(
    //             mainAxisAlignment: MainAxisAlignment.spaceAround,
    //             children: [
    //               Text(
    //                 StringManager.filename,
    //                 style: TextStyleManager.light13(),
    //               ),
    //               Text(
    //                 StringManager.deuration,
    //                 style: TextStyleManager.light13(),
    //               ),
    //             ],
    //           ),
    //         ],
    //       ),
    //     ),
    //     Spacer(
    //       flex: 4,
    //     ),
    //     DefaultButton(
    //       text: StringManager.translate,
    //       onPressed: () {},
    //     ),
    //     SizedBox(height: HeightManager.h20),
    //     DefaultButton(
    //       text: StringManager.cancel,
    //       onPressed: () {},
    //     ),
    //     Spacer(
    //       flex: 2,
    //     ),
    //   ],
    // );