import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduate_project/core/dependency_injection/di.dart';
import 'package:graduate_project/core/resource/color_manager.dart';
import 'package:graduate_project/core/resource/distance_manager.dart';
import 'package:graduate_project/core/resource/image_manager.dart';
import 'package:graduate_project/core/manager/manage_user_data/manager_user_data_cubit.dart';
import 'package:graduate_project/features/profile/manager/change_image_cubit/change_image_cubit.dart';
import 'package:redacted/redacted.dart';

class CustomProfileImage extends StatelessWidget {
  const CustomProfileImage({
    super.key,
    this.canChangeImage = false,
  });
  final bool canChangeImage;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(
          value: di<ChangeImageCubit>(),
        ),
        BlocProvider.value(
          value: di<ManagerUserDataCubit>(),
        ),
      ],
      child: Builder(builder: (context) {
        return Align(
          alignment: Alignment.center,
          child: Stack(
            children: [
              Container(
                height: WidthManager.w160,
                width: WidthManager.w160,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: ColorManager.primaryColor,
                  border: Border.all(
                    color: ColorManager.primaryColor,
                    width: WidthManager.w3,
                  ),
                ),
                clipBehavior: Clip.antiAlias,
                child: BlocBuilder<ManagerUserDataCubit, ManagerUserDataState>(
                  builder: (context, state) {
                    return BlocBuilder<ChangeImageCubit, ChangeImageState>(
                      builder: (context, state) {
                        return ClipOval(
                          child: ChangeImageCubit.get(context).image != null
                              ? Image.file(
                                  File(ChangeImageCubit.get(context)
                                      .image!
                                      .path),
                                  fit: BoxFit.cover,
                                )
                              : ManagerUserDataCubit.get(context).imageurl !=
                                      null
                                  ? Image.network(
                                      ManagerUserDataCubit.get(context)
                                          .imageurl!,
                                      fit: BoxFit.cover,
                                      loadingBuilder:
                                          (context, child, loadingProgress) {
                                        if (loadingProgress == null) {
                                          return child;
                                        }
                                        return Image.asset(
                                          ImageManager.profileImage,
                                          fit: BoxFit.cover,
                                        ).redacted(
                                          context: context,
                                          redact: true,
                                          configuration: RedactedConfiguration(
                                            animationDuration: const Duration(
                                                milliseconds: 800), //default
                                          ),
                                        );
                                      },
                                      errorBuilder:
                                          (context, error, stackTrace) {
                                        return Image.asset(
                                          ImageManager.profileImage,
                                          fit: BoxFit.fill,
                                        );
                                      },
                                    )
                                  : Image.asset(
                                      ImageManager.profileImage,
                                      fit: BoxFit.fill,
                                    ),
                        );
                      },
                    );
                  },
                ),
              ),
              canChangeImage
                  ? Positioned(
                      right: 10,
                      bottom: 14,
                      child: InkWell(
                        onTap: canChangeImage
                            ? ChangeImageCubit.get(context).getImageFromGallery
                            : null,
                        child: Container(
                          height: WidthManager.w21,
                          width: WidthManager.w21,
                          decoration: BoxDecoration(
                            color: ColorManager.primaryColor,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.photo_camera,
                            size: WidthManager.w12,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )
                  : SizedBox(),
            ],
          ),
        );
      }),
    );
  }
}
