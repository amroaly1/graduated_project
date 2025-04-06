import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graduate_project/core/resource/color_manager.dart';
import 'package:graduate_project/core/resource/distance_manager.dart';
import 'package:graduate_project/core/resource/icon_manager.dart';
import 'package:graduate_project/core/resource/string_manager.dart';
import 'package:graduate_project/core/resource/text_style_manager.dart';
import 'package:graduate_project/features/home/manager/home_cubit/cubit/home_cubit.dart';
import 'package:graduate_project/features/home/manager/home_cubit/cubit/home_state.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: PopScope(
        canPop: false,
        child: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            return Scaffold(
              bottomNavigationBar: BottomNavigationBar(
                currentIndex: HomeCubit.get(context).currentIndex,
                onTap: HomeCubit.get(context).chnageCurrentIndex,
                type: BottomNavigationBarType.fixed, // Fixed
                backgroundColor: ColorManager.whight,
                selectedLabelStyle: TextStyleManager.bold12(
                  color: ColorManager.blue1,
                ),
                unselectedLabelStyle: TextStyleManager.bold12(),
                selectedItemColor: ColorManager.blue1,
                unselectedItemColor: ColorManager.gray1,

                items: [
                  BottomNavigationBarItem(
                    icon: unSelectedIcon(
                      icon: IconManager.home,
                    ),
                    label: StringManager.home,
                    activeIcon: selectedIcon(
                      icon: IconManager.home,
                    ),
                  ),
                  BottomNavigationBarItem(
                    icon: unSelectedIcon(
                      icon: IconManager.cloudupload,
                    ),
                    label: StringManager.upload,
                    activeIcon: selectedIcon(
                      icon: IconManager.cloudupload,
                    ),
                  ),
                  BottomNavigationBarItem(
                    icon: unSelectedIcon(
                      icon: IconManager.stream,
                    ),
                    label: StringManager.stream,
                    activeIcon: selectedIcon(
                      icon: IconManager.stream,
                    ),
                  ),
                  BottomNavigationBarItem(
                    icon: unSelectedIcon(
                      icon: IconManager.translate,
                    ),
                    label: StringManager.translate,
                    activeIcon: selectedIcon(
                      icon: IconManager.translate,
                    ),
                  ),
                  BottomNavigationBarItem(
                    icon: unSelectedIcon(
                      icon: IconManager.learn,
                    ),
                    label: StringManager.learn,
                    activeIcon: selectedIcon(
                      icon: IconManager.learn,
                    ),
                  ),
                ],
              ),
              body: HomeCubit.get(context).myBody(),
            );
          },
        ),
      ),
    );
  }

  SvgPicture selectedIcon({required String icon}) {
    return SvgPicture.asset(
      icon,
      colorFilter: ColorFilter.mode(
        ColorManager.primaryColor,
        BlendMode.srcIn,
      ),
      width: WidthManager.w24,
      height: HeightManager.h24,
      fit: BoxFit.scaleDown,
    );
  }

  SvgPicture unSelectedIcon({required String icon}) {
    return SvgPicture.asset(
      icon,
      width: WidthManager.w24,
      height: HeightManager.h24,
      fit: BoxFit.scaleDown,
    );
  }
}
