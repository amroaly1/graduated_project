import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduate_project/core/dependency_injection/di.dart';
import 'package:graduate_project/core/helper/custom_confirm_bottom_navigation_sheet.dart';
import 'package:graduate_project/core/resource/color_manager.dart';
import 'package:graduate_project/core/resource/distance_manager.dart';
import 'package:graduate_project/core/resource/icon_manager.dart';
import 'package:graduate_project/core/resource/padding_manager.dart';
import 'package:graduate_project/core/resource/string_manager.dart';
import 'package:graduate_project/core/resource/text_style_manager.dart';
import 'package:graduate_project/core/route/navigation_manager.dart';
import 'package:graduate_project/core/route/screen_manager.dart';
import 'package:graduate_project/features/dictionary/manager/manage_user_data/manager_user_data_cubit.dart';
import 'package:graduate_project/features/profile/presentation/widget/custom_profile_card.dart';
import 'package:graduate_project/features/profile/presentation/widget/custom_profile_image.dart';

class ProfileBodyView extends StatelessWidget {
  const ProfileBodyView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: di<ManagerUserDataCubit>(),
      child: SafeArea(
        child: Padding(
          padding: PaddingManager.paddingHorizontal24,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: HeightManager.h60,
              ),
              Text(
                StringManager.profile,
                style: TextStyleManager.black24(
                  color: ColorManager.blackwithOpacity70,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: HeightManager.h26,
              ),
              CustomProfileImage(),
              SizedBox(
                height: HeightManager.h20,
              ),
              BlocBuilder<ManagerUserDataCubit, ManagerUserDataState>(
                builder: (context, state) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        "${ManagerUserDataCubit.get(context).firstname} ${ManagerUserDataCubit.get(context).lastname}",
                        style: TextStyleManager.black24(
                          color: ColorManager.blackwithOpacity70,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        ManagerUserDataCubit.get(context).username,
                        style: TextStyleManager.medium20(
                          color: ColorManager.blackwithOpacity50,
                          height: 1.2,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  );
                },
              ),
              SizedBox(
                height: HeightManager.h40,
              ),
              CardProfileSection(),
            ],
          ),
        ),
      ),
    );
  }
}

class CardProfileSection extends StatelessWidget {
  const CardProfileSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: HeightManager.h13,
      children: [
        CustomProfileCard(
          title: StringManager.editYourProfile,
          icon: IconManager.editicon,
          onTap: () {
            NavigationManager.push(
              context: context,
              screen: ScreenManager.editProfileView,
            );
          },
        ),
        CustomProfileCard(
          title: StringManager.changePassword,
          icon: IconManager.passwordicon,
          onTap: () {
            NavigationManager.push(
              context: context,
              screen: ScreenManager.changePasswordView,
            );
          },
        ),
        CustomProfileCard(
          title: StringManager.logOut,
          icon: IconManager.logOuticon,
          onTap: () {
            customConfirmBootomNavigationSheet(
              context: context,
              onTapYes: () {
                NavigationManager.pushNameAndReplaseUnti(
                  context: context,
                  screen: ScreenManager.welcomeView,
                );
              },
              onTapCancel: () {
                Navigator.pop(context);
              },
            );
          },
        ),
      ],
    );
  }
}
