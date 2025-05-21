import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graduate_project/core/dependency_injection/di.dart';
import 'package:graduate_project/core/resource/color_manager.dart';
import 'package:graduate_project/core/resource/distance_manager.dart';
import 'package:graduate_project/core/resource/icon_manager.dart';
import 'package:graduate_project/core/resource/string_manager.dart';
import 'package:graduate_project/core/resource/text_style_manager.dart';
import 'package:graduate_project/features/dictionary/manager/sign_dictionary/sign_dictionary_cubit.dart';
import 'package:graduate_project/features/home/manager/home_cubit/cubit/home_cubit.dart';
import 'package:graduate_project/features/home/manager/home_cubit/cubit/home_state.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: di<HomeCubit>()),
        BlocProvider.value(value: di<SignDictionaryCubit>()),
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
                        // BottomNavigationBarItem(
                        //   icon: unSelectedIcon(
                        //     icon: IconManager.translate,
                        //   ),
                        //   label: StringManager.translate,
                        //   activeIcon: selectedIcon(
                        //     icon: IconManager.translate,
                        //   ),
                        // ),
                        BottomNavigationBarItem(
                          icon: unSelectedIcon(
                            icon: IconManager.learn,
                          ),
                          label: StringManager.signDictionary,
                          activeIcon: selectedIcon(
                            icon: IconManager.learn,
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
                        height: HeightManager.h15,
                        color: ColorManager.whight,
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

abstract class CustomDuration {
  static const duration500 = Duration(milliseconds: 500);
  static const duration300 = Duration(milliseconds: 300);
}
