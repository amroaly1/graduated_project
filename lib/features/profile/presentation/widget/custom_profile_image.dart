import 'package:flutter/material.dart';
import 'package:graduate_project/core/resource/color_manager.dart';
import 'package:graduate_project/core/resource/distance_manager.dart';
import 'package:graduate_project/core/resource/image_manager.dart';
import 'package:redacted/redacted.dart';

class CustomProfileImage extends StatelessWidget {
  const CustomProfileImage({
    super.key,
    this.canChangeImage = false,
    this.onTapCamera,
  });
  final bool canChangeImage;
  final void Function()? onTapCamera;

  @override
  Widget build(BuildContext context) {
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
            child: ClipOval(
              child: Image.network(
                "https://images.pexels.com/photos/774909/pexels-photo-774909.jpeg?_gl=1*2kfovh*_ga*Nzk3MzQxMDE0LjE3Mjg2NTQyOTQ.*_ga_8JE65Q40S6*czE3NTExMDQ3MzMkbzEwJGcxJHQxNzUxMTA0ODUzJGozMCRsMCRoMA..",
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Image.asset(
                    ImageManager.profileImage,
                    fit: BoxFit.cover,
                  ).redacted(
                    context: context,
                    redact: true,
                    configuration: RedactedConfiguration(
                      animationDuration:
                          const Duration(milliseconds: 800), //default
                    ),
                  );
                },
                errorBuilder: (context, error, stackTrace) {
                  return Image.asset(
                    ImageManager.profileImage,
                    fit: BoxFit.fill,
                  );
                },
              ),
            ),
          ),
          canChangeImage
              ? Positioned(
                  right: 10,
                  bottom: 14,
                  child: InkWell(
                    onTap: canChangeImage ? onTapCamera : null,
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
  }
}
