import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graduate_project/core/dependency_injection/di.dart';
import 'package:graduate_project/core/resource/color_manager.dart';
import 'package:graduate_project/core/resource/distance_manager.dart';
import 'package:graduate_project/core/resource/icon_manager.dart';
import 'package:graduate_project/core/resource/string_manager.dart';
import 'package:graduate_project/core/resource/text_style_manager.dart';
import 'package:graduate_project/features/home/manager/home_cubit/cubit/home_cubit.dart';
import 'package:graduate_project/features/home/manager/home_cubit/cubit/home_state.dart';
import 'package:graduate_project/features/home/manager/home_dictionary/home_dictionary_cubit.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: di<HomeCubit>()),
        BlocProvider.value(value: di<HomeDictionaryCubit>()..init()),
      ],
      child: PopScope(
        canPop: false,
        child: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            return Scaffold(
              resizeToAvoidBottomInset: true,
              // bottomNavigationBar:
              body: Stack(
                children: [
                  Positioned.fill(
                    child: HomeCubit.get(context).myBody(),
                  ),
                  AnimatedPositioned(
                    duration: CustomDuration.duration300,
                    bottom: HomeCubit.get(context).isShowBottomNavigationBar
                        ? 0
                        : -HeightManager.h60,
                    right: 0,
                    left: 0,
                    child: BottomNavigationBar(
                      currentIndex: HomeCubit.get(context).currentIndex,
                      onTap: HomeCubit.get(context).chnageCurrentIndex,
                      type: BottomNavigationBarType.fixed, // Fixed
                      backgroundColor: ColorManager.whight3,
                      selectedLabelStyle: TextStyleManager.bold12(
                        color: ColorManager.blue3,
                      ),
                      unselectedLabelStyle: TextStyleManager.bold12(
                        color: ColorManager.primaryColorlight2,
                      ),
                      selectedItemColor: ColorManager.blue3,
                      unselectedItemColor: ColorManager.primaryColorlight2,
                      items: [
                        BottomNavigationBarItem(
                          icon: unSelectedIcon(
                            icon: IconManager.homeicon,
                          ),
                          label: StringManager.home,
                          activeIcon: selectedIcon(
                            icon: IconManager.homeicon,
                          ),
                        ),
                        BottomNavigationBarItem(
                          icon: unSelectedIcon(
                            icon: IconManager.bridgeicon,
                          ),
                          label: StringManager.bridge,
                          activeIcon: selectedIcon(
                            icon: IconManager.bridgeicon,
                          ),
                        ),
                        BottomNavigationBarItem(
                          icon: unSelectedIcon(
                            icon: IconManager.signGPTicon,
                          ),
                          label: StringManager.signGPT,
                          activeIcon: selectedIcon(
                            icon: IconManager.signGPTicon,
                          ),
                        ),
                        BottomNavigationBarItem(
                          icon: unSelectedIcon(
                            icon: IconManager.translateicon,
                          ),
                          label: StringManager.translate,
                          activeIcon: selectedIcon(
                            icon: IconManager.translateicon,
                          ),
                        ),
                        BottomNavigationBarItem(
                          icon: unSelectedIcon(
                            icon: IconManager.signifyicon,
                          ),
                          label: StringManager.signify,
                          activeIcon: selectedIcon(
                            icon: IconManager.signifyicon,
                          ),
                        ),
                        BottomNavigationBarItem(
                          icon: unSelectedIcon(
                            icon: IconManager.profileicon,
                          ),
                          label: StringManager.profile,
                          activeIcon: selectedIcon(
                            icon: IconManager.profileicon,
                          ),
                        ),
                      ],
                    ),
                  ),
                  AnimatedPositioned(
                    duration: CustomDuration.duration300,
                    bottom: HomeCubit.get(context).isShowBottomNavigationBar
                        ? HeightManager.h55
                        : 0,
                    left: 0,
                    right: 0,
                    child: GestureDetector(
                      onVerticalDragUpdate:
                          HomeCubit.get(context).onVerticalDragUpdate,
                      child: Container(
                        width: double.infinity,
                        height: HeightManager.h13,
                        color: ColorManager.whight2,
                      ),
                    ),
                  ),
                ],
              ),
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
        ColorManager.blue3,
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

abstract class CustomDuration {
  static const duration500 = Duration(milliseconds: 500);
  static const duration300 = Duration(milliseconds: 300);
}
