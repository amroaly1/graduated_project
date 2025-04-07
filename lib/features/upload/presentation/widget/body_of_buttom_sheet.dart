import 'package:flutter/material.dart';
import 'package:graduate_project/core/resource/color_manager.dart';
import 'package:graduate_project/core/resource/distance_manager.dart';
import 'package:graduate_project/features/upload/manager/cubit/upload_cubit.dart';

class BodyOfBoyyomSheet extends StatelessWidget {
  const BodyOfBoyyomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: HeightManager.h300,
      width: double.infinity,
      decoration: BoxDecoration(
        color: ColorManager.whight,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(RaduisValueManager.r20),
          topRight: Radius.circular(RaduisValueManager.r20),
        ),
      ),
      child: Column(
        children: [
          SizedBox(height: HeightManager.h20),
          Container(
            width: WidthManager.w70,
            height: HeightManager.h7,
            color: ColorManager.gray4,
          ),
          SizedBox(height: HeightManager.h20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: UploadCubit.get(context).pickVideoFromGalllery,
                icon: Icon(
                  Icons.photo_library,
                  size: HeightManager.h37,
                ),
              ),
              IconButton(
                onPressed: UploadCubit.get(context).pickVideoFromCamera,
                icon: Icon(
                  Icons.photo_camera,
                  size: HeightManager.h37,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
