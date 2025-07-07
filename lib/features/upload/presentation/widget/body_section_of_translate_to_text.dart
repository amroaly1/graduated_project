import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graduate_project/core/dependency_injection/di.dart';
import 'package:graduate_project/core/helper/show_snack_bar.dart';
import 'package:graduate_project/core/resource/color_manager.dart';
import 'package:graduate_project/core/resource/device_height_width_manager.dart';
import 'package:graduate_project/core/resource/distance_manager.dart';
import 'package:graduate_project/core/resource/icon_manager.dart';
import 'package:graduate_project/core/resource/padding_manager.dart';
import 'package:graduate_project/core/resource/text_style_manager.dart';
import 'package:graduate_project/features/upload/data/model/video_to_text_model.dart';
import 'package:graduate_project/features/upload/manager/saving_video_cubit/saving_video_cubit.dart';

class BodySectionOfTranaslateToText extends StatelessWidget {
  const BodySectionOfTranaslateToText({
    super.key,
    required this.data,
  });
  final VideoToTextModel data;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: PaddingManager.paddingHorizontal16,
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
          border: Border.all(
            color: ColorManager.primaryColor,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: WidthManager.w13),
          child: Column(
            children: [
              SizedBox(
                height: HeightManager.h18,
              ),
              TitleOfBoxOfVideoToText(
                videoToTextModel: data,
              ),
              SizedBox(
                height: HeightManager.h15,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Text(
                    data.text,
                    style: TextStyleManager.light13(
                      color: ColorManager.black,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: HeightManager.h10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TitleOfBoxOfVideoToText extends StatelessWidget {
  const TitleOfBoxOfVideoToText({
    super.key,
    required this.videoToTextModel,
  });
  final VideoToTextModel videoToTextModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "English",
          style: TextStyleManager.semiBold17(),
        ),
        Row(
          spacing: WidthManager.w13,
          children: [
            Material(
                color: Colors.transparent,
                child: InkWell(
                  splashColor: Colors.grey.shade400,
                  onTap: () {},
                  child: SvgPicture.asset(
                    height: HeightManager.h15,
                    IconManager.sharegrey,
                  ),
                )),
            Material(
              color: Colors.transparent,
              child: InkWell(
                splashColor: Colors.grey.shade400,
                onTap: () async {
                  // TODO : but text in it
                  await Clipboard.setData(
                      ClipboardData(text: videoToTextModel.text));

                  showSnackBar(
                    // ignore: use_build_context_synchronously
                    context,
                    message: "Text is Copied",
                  );
                },
                child: SvgPicture.asset(
                  height: HeightManager.h15,
                  IconManager.copygrey,
                ),
              ),
            ),
            BlocProvider.value(
              value: di<SavingVideoCubit>()..init(),
              child: BlocConsumer<SavingVideoCubit, SavingVideoState>(
                listener: (context, state) {
                  if (state is SavingVideoErrorState) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(state.errMessage)));
                  }
                },
                builder: (context, state) {
                  return Material(
                    color: Colors.transparent,
                    child: InkWell(
                      splashColor: Colors.grey.shade400,
                      onTap: () => SavingVideoCubit.get(context).onTap(
                          trsnlationid: videoToTextModel.translationId,
                          returnaudio: false),
                      child: Icon(
                        SavingVideoCubit.get(context).isSaved
                            ? Icons.bookmark
                            : Icons.bookmark_border_outlined,
                        color: ColorManager.primaryColor,
                        size: HeightManager.h20,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
