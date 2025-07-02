import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduate_project/core/dependency_injection/di.dart';
import 'package:graduate_project/core/manager/manage_user_data/manager_user_data_cubit.dart';
import 'package:graduate_project/core/resource/color_manager.dart';
import 'package:graduate_project/core/resource/distance_manager.dart';
import 'package:graduate_project/core/resource/font_family_manger.dart';
import 'package:graduate_project/core/resource/image_manager.dart';
import 'package:graduate_project/core/resource/string_manager.dart';
import 'package:graduate_project/core/resource/text_style_manager.dart';
import 'package:redacted/redacted.dart';

class CustomNameAndImageHomeView extends StatelessWidget {
  const CustomNameAndImageHomeView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: di<ManagerUserDataCubit>(),
      child: BlocBuilder<ManagerUserDataCubit, ManagerUserDataState>(
        builder: (context, state) {
          return Row(
            children: [
              Container(
                width: WidthManager.w50,
                height: HeightManager.h50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                ),
                clipBehavior: Clip.antiAlias,
                child: ManagerUserDataCubit.get(context).imageurl != null
                    ? Image.network(
                        ManagerUserDataCubit.get(context).imageurl!,
                        fit: BoxFit.cover,
                        loadingBuilder: (context, child, loadingProgress) {
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
                      )
                    : Image.asset(
                        ImageManager.profileImage,
                        fit: BoxFit.fill,
                      ),
              ),
              SizedBox(
                width: WidthManager.w6,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Hi, ${ManagerUserDataCubit.get(context).firstname}  👋 ",
                    style: TextStyleManager.bold16(
                      fontFamily: FontFamilyManger.hvDTrialBrandonGrotesque,
                      color: ColorManager.black2,
                    ),
                  ),
                  Text(
                    StringManager.readytotranslatesomethingtoday,
                    style: TextStyleManager.regular10(),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
